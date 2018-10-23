#!/bin/bash

file=${1}
pause=${2}

node_modules/.bin/decktape --pause=${pause} --size=1024x768 --chrome-arg=--allow-file-access-from-files remark ${file}/index.html ${file}/${file}.pdf
