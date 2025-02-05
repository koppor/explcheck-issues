#!/usr/bin/env python3

import json
import re
from collections import defaultdict

# Load the JSON data
with open('errors.json', 'r') as file:
    data = json.load(file)

# Define the regex pattern
pattern = r"/tmp/texlive/usr/local/texlive/\\d{4}/"

# Update the filenames
for entry in data:
    entry['filename'] = re.sub(pattern, '', entry['filename'])

# Dictionary to store combined results
summarized_data = defaultdict(lambda: {'lines': [], 'types': defaultdict(int)})

for entry in data:
    filename = entry['filename']
    summarized_data[filename]['lines'].extend(entry['lines'])
    summarized_data[filename]['types'][str(entry['type'])] += 1

# Convert defaultdict to regular dict for JSON serialization
output_data = []
for filename, details in summarized_data.items():
    output_data.append({
        'filename': filename,
        'lines': details['lines'],
        **details['types']  # Unpack type counts
    })

# Save the summarized JSON
with open('errors-summarized.json', 'w') as file:
    json.dump(output_data, file, indent=2)  

# Print the result for verification
print(json.dumps(output_data, indent=2))
