import os
import json
import shutil
import re
from pathlib import Path

# Load errors.json
total_errors = []
with open('errors.json', 'r') as f:
    total_errors = json.load(f)

total = len(total_errors)
error_filenames = sorted(set(error['filename'].strip() for error in total_errors))

# Read the entire errors.txt once and map errors to their files
with open('errors.txt', 'r') as f:
    all_errors_txt = f.readlines()

errors_map = {}
for line in all_errors_txt:
    for filename in error_filenames:
        if filename in line:
            if filename not in errors_map:
                errors_map[filename] = []
            errors_map[filename].append(line)

# Sort the errors for each file
for filename in errors_map:
    errors_map[filename].sort(key=lambda x: [int(s) if s.isdigit() else s for s in re.split(r'(\d+)', x)])

counter = 0

for filepath in error_filenames:
    # Filter errors for the current file
    filtered_errors = [error for error in total_errors if error['filename'] == filepath]

    # Create target path
    target_path = re.sub(r'^/tmp/texlive/usr/local/texlive/\d{4}/', '', filepath)
    publish_path = Path(f'publish/{target_path}')
    publish_path.mkdir(parents=True, exist_ok=True)

    # Write filtered errors to errors.json
    with open(publish_path / 'errors.json', 'w') as f:
        json.dump(filtered_errors, f, indent=2)

    # Copy original file
    shutil.copy(filepath, publish_path)

    # Write errors.txt from the precomputed map
    relevant_errors = errors_map.get(filepath, [])
    with open(publish_path / 'errors.txt', 'w') as f:
        f.writelines(relevant_errors)

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
    
    html_content = html_content.replace('../node_modules', f'../{repeat_up}node_modules')
    html_content = html_content.replace('./latex.json', f'../{repeat_up}latex.json')

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
