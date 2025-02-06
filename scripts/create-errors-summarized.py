#!/usr/bin/env python3

import json
import re
from collections import defaultdict

# Load the JSON data
with open('errors.json', 'r') as file:
    data = json.load(file)

# Define the regex pattern
pattern = r"/tmp/texlive/usr/local/texlive/\d{4}/"

# Update the filenames
for entry in data:
    entry['filename'] = re.sub(pattern, '', entry['filename'])

# Dictionary to store combined results
summarized_data = defaultdict(lambda: {'lines': [], 'types': defaultdict(int)})

# Type mapping
type_mapping = {
    '101': 'errors',
    '115': 'style',
    '119': 'warnings'
}

# Extract unique error messages (only the message part)
error_messages = set()

for entry in data:
    filename = entry['filename']
    summarized_data[filename]['lines'].extend(entry['lines'])
    type_key = type_mapping.get(str(entry['type']), str(entry['type']))
    summarized_data[filename]['types'][type_key] += 1

    # Extract text after the last colon
    for line in entry['lines']:
        parts = line.split(':')
        if len(parts) > 1:
            error_messages.add(parts[-1].strip())  # Take only the actual message part

# Convert defaultdict to regular dict for JSON serialization
output_data = []
for filename, details in summarized_data.items():
    output_data.append({
        'filename': filename,
        'lines': details['lines'],
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
