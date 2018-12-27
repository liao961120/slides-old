#!/bin/bash
pause=${1}

# Download archive.tar.gz
wget https://raw.githubusercontent.com/liao961120/slides/gh-pages/archive.tar.gz
tar -xvzf archive.tar.gz


python -m SimpleHTTPServer &
# Loop over every file in list.txt
while read p; do
    url=$(echo "$p" | cut -d ',' -f 3)
    [[ ${url} != 'local' ]] && continue # Skip google slide
  
    file=$(echo "$p" | cut -d ',' -f 2)  
    # If web page available
    if [[ -e archive/${file}/${file}.pdf ]]; then
        [[ -d ${file} ]] && cp -r archive/${file}/* ${file}/
    else
        Rscript -e "rmarkdown::render(\"${file}/index.Rmd\")"
        node_modules/.bin/decktape --pause=$pause --size=1024x768 \
            --chrome-arg=--allow-file-access-from-files \
            remark ${file}/index.html ${file}/${file}.pdf
    fi
done < list.txt


# Always build the newest slide (first entry in list.txt
## Exit if the newest slide is google slide
url=$(head -n 1 list.txt | cut -d ',' -f 3)
[[ ${url} != 'local' ]] && exit 0

file=$(head -n 1 list.txt | cut -d ',' -f 2)
Rscript -e "rmarkdown::render(\"${file}/index.Rmd\")"

echo 'decktape: start printing PDF'
node_modules/.bin/decktape --pause=$pause --size=1024x768 \
    --chrome-arg=--allow-file-access-from-files remark \
    ${file}/index.html ${file}/${file}.pdf

#docker run --rm -it --privileged -v `pwd`:/slides -v ~:/home/user astefanutti/decktape \
#    --pause=${pause} --size=1024x768 \
#    --chrome-arg=--allow-file-access-from-files remark \
#    ${file}/index.html ${file}/${file}.pdf

# Clean up: Remove archive
rm -r archive
rm -r archive.tar.gz
