#!/bin/bash

# Create index file
file_list=$(ls -d */ | egrep -o [a-zA-Z0-9_-]+)

# Create docs/ and put slide folders in it
[ -d docs ] || mkdir docs
for i in $file_list; do
    cp -r $i docs
done

# Create Slide Archive
[[ -d archive ]] || mkdir archive
cp -r docs/* archive
rm -r archive/img #archive/*/*.pdf
tar -zcvf archive.tar.gz archive
rm -r archive
mv archive.tar.gz docs/
#tar -xvzf archive.tar.gz

# Create index.md from list of directories
touch docs/index.md

# index.md title
cat >> docs/index.md  << _EOF_
[![Build Status](https://travis-ci.org/liao961120/slides.svg?branch=master)](https://travis-ci.org/liao961120/slides)

# List of Slides
<br><br>

_EOF_

# Auto generate slide links
#for i in $file_list; do
#    printf "[$i](${i}/index.html)\n\n" >> docs/index.md
#done

while read p; do
  date=$(echo "$p" | cut -d ',' -f 1)
  file=$(echo "$p" | cut -d ',' -f 2)
  url=$(echo "$p" | cut -d ',' -f 3)
  
  if [[ ${url} == 'local' ]]; then
    printf "$date &nbsp;&nbsp; [$file](${file}){:target='_blank'} ([PDF](${file}/${file}.pdf){:target='_blank'})\n\n" >> docs/index.md
  else
    printf "$date &nbsp;&nbsp; [$file](${url}){:target='_blank'}\n\n" >> docs/index.md
  fi
done < list.txt


# Set page theme
printf 'theme: jekyll-theme-architect' > docs/_config.yml
