#!/bin/bash
# Author: Syretia
# License: MIT
# Dependencies: jq
# run this script from the base directory of the git repo and redirect the output to './commands/info/supported.md'

# create array of keys from first entry to use as headers of table
mapfile -t headers < <(jq -r '.[0] | keys_unsorted[]' ./commands/info/supported.json)
# output headers in table format
echo -n '|'
for header in "${headers[@]}"; do
	header="$(echo "$header" | tr '_' ' ' | sed -e "s/\b\(.\)/\u\1/g")"
	echo -n " $header |"
done
# output a separator for each header
echo
echo -n '|'
for header in "${headers[@]}"; do
	echo -n ' --- |'
done
echo
# output each entry in table format
jq '.[]' ./commands/info/supported.json | \
jq -r '[ to_entries | .[].value ] | "| " + join(" | ") + " |"'
