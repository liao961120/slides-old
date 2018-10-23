#!/bin/bash

pause=${1}

# Read the newest slide if no input
p=$(head -n 1 list.txt)
file=$(echo "$p" | cut -d ',' -f 2)

node_modules/.bin/decktape --pause=$pause --size=1024x768 --chrome-arg=--allow-file-access-from-files remark ${file}/index.html ${file}/${file}.pdf
