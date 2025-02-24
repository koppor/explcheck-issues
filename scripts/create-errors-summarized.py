#!/usr/bin/env python3

import json
import re
from collections import defaultdict

# Load the JSON data
with open('errors.json', 'r') as file:
    data = json.load(file)

# Define the regex pattern
pattern = r"/tmp/texlive/usr/local/texlive/\d{4}/"

# Dictionary to store combined results
summarized_data = defaultdict(lambda: {'lines': [], 'identifiers': set(), 'types': defaultdict(list)})

# Type mapping
type_mapping = {
    'e': 'errors',
    's': 'warnings',
    't': 'errors',
    'w': 'warnings',
}

# Extract unique error messages (only the message part)
error_messages = set()

for entry in data:
    # Remove pattern from filename
    filename = re.sub(pattern, '', entry['filename'])
    if not filename:
      continue  # Skip entries with an empty filename

    # Remove pattern from lines
    cleaned_lines = [re.sub(pattern, '', line) for line in entry['lines']]

    summarized_data[filename]['lines'].extend(cleaned_lines)
    identifier = f"{chr(entry['type'])}{entry['nr']}"
    summarized_data[filename]['identifiers'].add(identifier)
    type_key = type_mapping[chr(entry['type'])]
    summarized_data[filename]['types'][type_key].append(identifier)

    # Extract text after the last colon for unique error messages
    for line in cleaned_lines:
        parts = line.split(':')
        if len(parts) > 1:
            error_messages.add(parts[-1].strip())  # Take only the actual message part

# Convert defaultdict to regular dict for JSON serialization
output_data = []
for filename, details in summarized_data.items():
    output_data.append({
        'filename': filename,
        'lines': details['lines'],
        'identifiers': sorted(details['identifiers']),
        **details['types']  # Unpack type counts
    })

# Save summarized JSON
with open('errors-summarized.json', 'w') as file:
    json.dump(output_data, file, indent=2)

# Convert set to sorted list
error_messages_sorted = sorted(error_messages)

# Save extracted error messages
with open('errors-list.json', 'w') as file:
    json.dump(error_messages_sorted, file, indent=2)
