#!/usr/bin/env nu
# Author: Syretia
# License: MIT
# Dependencies: nushell
# run this script from the base directory of the git repo and redirect the output to './commands/info/supported.md'

# sort by name, rename columns, output as markdown table
open ./commands/info/supported.json | sort-by -ni name | rename Name Supported "Experience Level" Recommended Notes | to md
