#!/bin/bash

# Creates a directory with index.html, the file itself, errors.txt, errors.json for browsing

set -e

counter=0
total=$(jq length errors.json)

jq -r '.[].filename' < errors.json | sed 's/\r$//' | sort -u | while read -r filepath; do
  filtered_errors=$(jq --arg filename "$filepath" '[.[] | select(.filename == $filename)]' < errors.json)

  # We use the filename of the errored file as directory name
  # In that directory, more files (errors.json, ...) will be placed

  target_path=${filepath#/tmp/texlive/usr/local/texlive/[0-9][0-9][0-9][0-9]/}

  mkdir -p "publish/$target_path"

  echo $filtered_errors > "publish/$target_path/errors.json"
  cp $filepath "publish/$target_path/"

  sed -i "s/e102.tex/$(basename $target_path)/" "publish/$target_path/index.html"

  grep $filepath errors.txt | sort -V > "publish/$target_path/errors.txt"

  # Copy index.html to the new directory (rename it to match filename if needed)
  cp pages/file/index.html "publish/$target_path/index.html"

  # Split path into an array using '/' as a delimiter
  IFS='/' read -r -a path_parts <<< "$target_path"
  breadcrumb_html=""

  # Determine how many levels deep we are to set the base link correctly
  depth=${#path_parts[@]}

  repeat_up=$(printf '../%.0s' $(seq 1 $depth))
  sed -i "s#../node_modules#../${repeat_up}node_modules#" "publish/$target_path/index.html"
  sed -i "s#./latex.json#../${repeat_up}latex.json#" "publish/$target_path/index.html"

  # Add Home link pointing to the root
  breadcrumb_html+="<li class=\"breadcrumb-item\"><a href=\"$(printf '../%.0s' $(seq 1 $depth))\">Home</a></li>\n"

  # Build breadcrumbs for each part
  for ((i=0; i<depth; i++)); do
    part="${path_parts[$i]}"

    # If it's the last part, link to '#', else calculate relative path
    if [[ $i -eq $((depth - 1)) ]]; then
      link="#"
    else
      up_levels=$((depth - i - 1))
      link="$(printf '../%.0s' $(seq 1 $up_levels))"
    fi

    # Append the breadcrumb item
    breadcrumb_html+="<li class=\"breadcrumb-item\"><a href=\"$link\">$part</a></li>\n"
  done

  # Replace NAV placeholder in the target HTML file
  sed -i "s!NAV!${breadcrumb_html}!" "publish/$target_path/index.html"
      
  if [[ "$target_path" == *lua ]]; then
    sed -i "s/'latex'/'lua'/" "publish/$target_path/index.html"
  fi

  counter=$((counter + 1))
  if (( counter % 100 == 0 )); then
      percent=$(( counter / total ))
      echo "Processed $counter files ($percent%)"
      echo "Processing file #$counter: $filepath"
  fi
done
