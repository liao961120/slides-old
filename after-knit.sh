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
rm -r archive/img archive/archive #archive/*/*.pdf
tar -zcvf archive.tar.gz archive
mv archive.tar.gz docs/

# Clean up
[[ -d archive ]] && rm -r archive
[[ -d docs/archive ]] && rm -r docs/archive


# Create index.md from list of directories
touch docs/index.md


# index.md title
cat >> docs/index.md << _EOF_
[![Build Status](https://travis-ci.org/liao961120/slides.svg?branch=master)](https://travis-ci.org/liao961120/slides)

<style>
.tab0 { padding-left: 1.1em; }
.mono { font-family: monospace; }
code { 
  font-stretch: condensed;
  padding-left: 0px;
  background-color: rgba(51, 51, 51, 0);
  border: 0px;
  }
</style>


_EOF_


# Write slide links
while read p; do
    date=$(echo "$p" | cut -d ';' -f 1)
    file=$(echo "$p" | cut -d ';' -f 2)
    url=$(echo "$p" | cut -d ';' -f 3)
  
    if [[ ${url} == 'local' ]]; then
        printf "<code>$date</code> [$file](${file}){:target='_blank' .tab0} ([PDF](${file}/${file}.pdf){:target='_blank'})\n\n" >> docs/index.md
    else
        printf "<code>$date</code> [$file](${url}){:target='_blank' .tab0}\n\n" >> docs/index.md
    fi
done < list.txt


# Set page theme
#printf 'theme: jekyll-theme-architect' > docs/_config.yml

cat > docs/_config.yml << _EOF_

title: Slides
description: Build, print, and deploy xaringan slides automatically
show_downloads: false
google_analytics: UA-129572979-1
theme: jekyll-theme-tactile

_EOF_
