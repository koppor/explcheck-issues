#!/bin/bash

generate_index() {
  local dir="$1"
  local rel_path="$2"
  
  # Skip if index.html already exists
  if [ -f "$dir/index.html" ]; then
    return
  fi

  # Create breadcrumb navigation
  local breadcrumb=""
  IFS='/' read -ra PARTS <<< "$rel_path"
  local depth=${#PARTS[@]}

  # Create relative path for node_modules
  local css_path=""
  for (( i=0; i<$depth; i++ )); do
    css_path+="../"
  done
  css_path+="node_modules/bootstrap/dist/css/bootstrap.min.css"

  for (( i=0; i<${#PARTS[@]}; i++ )); do
    part="${PARTS[$i]}"
    if [ -n "$part" ]; then
      local remaining_depth=$((depth - i - 1))
      if [ $remaining_depth -eq 0 ]; then
        breadcrumb+=$'<li class="breadcrumb-item"><a href="#">'$part'</a></li>\n'
      else
        local path_prefix=""
        for (( j=0; j<$remaining_depth; j++ )); do
          path_prefix+="../"
        done
        breadcrumb+=$'<li class="breadcrumb-item"><a href="'$path_prefix'">'$part'</a></li>\n'
      fi
    fi
  done
  
  # Start HTML file
  cat <<EOF > "$dir/index.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index of $rel_path</title>
    <link rel="stylesheet" href="$css_path">
</head>
<body>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
$(echo -e "$breadcrumb")
    </ol>
  </nav>
    <h1>Index of $rel_path</h1>
    <ul>
EOF

  # List subdirectories
  for subdir in "$dir"/*/; do
    if [ -d "$subdir" ]; then
      subdir_name=$(basename "$subdir")
      echo "        <li><a href=\"$subdir_name/\">$subdir_name</a></li>" >> "$dir/index.html"
    fi
  done

  # Close HTML file
  cat <<EOF >> "$dir/index.html"
    </ul>
</body>
</html>
EOF
}

export -f generate_index

# Main execution starting from $dir
dir=${1:-.} # Default to current directory if not specified

find "$dir" -type d -exec bash -c 'generate_index "$0" "${0#"'$dir'/"}"' {} \;
