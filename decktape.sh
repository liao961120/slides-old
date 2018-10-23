#!/bin/bash

pause=${1}

# Read the newest slide if no input
#p=$(head -n 1 list.txt)
#file=$(echo "$p" | cut -d ',' -f 2)

#node_modules/.bin/decktape --pause=$pause --size=1024x768 --chrome-arg=--allow-file-access-from-files remark ${file}/index.html ${file}/${file}.pdf


while read p; do
  file=$(echo "$p" | cut -d ',' -f 2)
  
  ## Check if web page available
  curl -L -s --head https://github.com/liao961120/slides/blob/gh-pages/${file}/${file}.pdf | head -n 1 | grep "HTTP/1.[01] [23].." > foo.txt
  exist=$(head -n 1 foo.txt)

  # when empty string, i.e. file doesn't exist in github gh-pages branch
  if [ -z ${exist} ]; then
    # Print slide to PDF
    node_modules/.bin/decktape --pause=$pause --size=1024x768 --chrome-arg=--allow-file-access-from-files remark ${file}/index.html ${file}/${file}.pdf   
  # when file exist
  else
    # Dowload pdf from liao961120.github.io into folder
    bash dwnpdf.sh $file
  fi
  
done < list.txt

