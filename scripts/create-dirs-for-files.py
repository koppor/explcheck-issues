#!/usr/bin/env python3

# Creates index.html, errors.json, and errors.txt for each errored file

import os
import json
import shutil
import re
from pathlib import Path

# Load errors.json
total_errors = []
with open('errors.json', 'r') as f:
    total_errors = json.load(f)

error_filenames = sorted(set(error['filename'].strip() for error in total_errors))

total = len(error_filenames)

pattern = r"/tmp/texlive/usr/local/texlive/\d{4}/"

counter = 0

for filepath in error_filenames:
    if not filepath:
        print("Skipping empty filepath!")
        continue

    # Filter errors for the current file
    filtered_errors = [error for error in total_errors if error['filename'] == filepath]

    # Remove prefix from "lines" entries
    for error in filtered_errors:
        error['lines'] = [re.sub(pattern, '', line) for line in error.get('lines', [])]

    # Extract error lines
    error_lines = [line for error in filtered_errors for line in error.get('lines', [])]
    
    # Create target path
    target_path = re.sub(pattern, '', filepath)
    publish_path = Path(f'publish/{target_path}')
    publish_path.mkdir(parents=True, exist_ok=True)

    # Write filtered errors to errors.json
    with open(publish_path / 'errors.json', 'w') as f:
        json.dump(filtered_errors, f, indent=2)

    # Write errors.txt based on the "lines" array
    with open(publish_path / 'errors.txt', 'w') as f:
        cleaned_errors = [line + '\n' for line in error_lines]
        f.writelines(cleaned_errors)

    # Copy original file
    shutil.copy(filepath, publish_path)

    # Copy and modify index.html
    index_html_path = publish_path / 'index.html'
    shutil.copy('pages/file/index.html', index_html_path)

    with open(index_html_path, 'r') as f:
        html_content = f.read()

    basename = os.path.basename(target_path)
    html_content = html_content.replace('e102.tex', basename)

    # Adjust relative paths and breadcrumbs
    path_parts = target_path.split('/')
    depth = len(path_parts)
    repeat_up = '../' * depth
    
    html_content = html_content.replace('../node_modules', f'{repeat_up}node_modules')
    html_content = html_content.replace('./latex.json', f'{repeat_up}latex.json')

    breadcrumb_html = '<li class="breadcrumb-item"><a href="{}">Home</a></li>\n'.format(repeat_up)
    for i, part in enumerate(path_parts):
        if i == depth - 1:
            link = '#'
        else:
            up_levels = '../' * (depth - i - 1)
            link = up_levels
        breadcrumb_html += f'<li class="breadcrumb-item"><a href="{link}">{part}</a></li>\n'

    html_content = html_content.replace('NAV', breadcrumb_html)

    if target_path.endswith('lua'):
        html_content = html_content.replace("'latex'", "'lua'")

    # Write modified HTML back
    with open(index_html_path, 'w') as f:
        f.write(html_content)

    # Progress tracking
    counter += 1
    if counter % 100 == 0:
        percent = (counter / total) * 100
        print(f'Processed {counter} of {total} files ({percent:.2f}%)')
        print(f'Processing file #{counter}: {filepath}')
