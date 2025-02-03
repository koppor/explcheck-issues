#!/bin/bash

set -e

jq -r '.[].filename' < errors.json | sed 's/\r$//' | sort -u | while read -r filepath; do
  filtered_errors=$(jq --arg filename "$filepath" '[.[] | select(.filename == $filename)]' < errors.json)

  # Remove leading slash to prevent absolute paths
  dir_path="${filepath#/}"

  # Extract directory (removing filename from path)
  # dir_path="$(dirname "$dir_path")"

  # Create directory structure
  mkdir -p "publish/$dir_path"

  echo $filtered_errors > "publish/$dir_path/errors.json"
  cp $dir_path "publish/$dir_path/"
  grep $filepath errors.txt | sort -V > "publish/$dir_path/errors.txt"

  # Copy index.html to the new directory (rename it to match filename if needed)
  cp pages/file/index.html "publish/$dir_path/index.html"

  dir_levels=$(awk -F'/' '{print NF-1}' <<< "$dir_path")
  repeat_up=""
  for ((i=0; i<dir_levels; i++)); do
    repeat_up+="../"
  done
  sed -i "s#../node_modules#../${repeat_up}node_modules#" "publish/$dir_path/index.html"
  sed -i "s#./latex.json#../${repeat_up}latex.json#" "publish/$dir_path/index.html"
  sed -i "s#HOME#../${repeat_up}#" "publish/$dir_path/index.html"

  sed -i "s/e102.lua/$(basename $dir_path)/" "publish/$dir_path/index.html"

  # Split path into an array using '/' as a delimiter
  IFS='/' read -r -a path_parts <<< "$dir_path"
  breadcrumb_html=""
  link_prefix=""
  for ((i=0; i<${#path_parts[@]}; i++)); do
    part="${path_parts[$i]}"

    # Build the correct link based on current depth
    link="$link_prefix"

    # Append the breadcrumb item
    breadcrumb_html+="<li class=\"breadcrumb-item\"><a href=\"$link\">$part</a></li>\n"

    # Update link_prefix to go one level deeper
    link_prefix+="${part}/"
  done

  sed -i "s#NAV#$breadcrumb_html#" "publish/$dir_path/index.html"
      
  if [[ "$dir_path" == *tex ]]; then
    sed -i "s/'lua'/'latex'/" "publish/$dir_path/index.html"
  fi
done
