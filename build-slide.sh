#!/bin/bash

pause=${1}

# Loop over every file in list.txt
while read p; do

  file=$(echo "$p" | cut -d ',' -f 2)

  # Check if web page available
  curl -L -s --head https://github.com/liao961120/slides/blob/gh-pages/${file}/${file}.pdf | head -n 1 | grep "HTTP/1.[01] [23].." > foo.txt
  exist=$(head -n 1 foo.txt)


  ### When empty string, i.e. file doesn't exist in github gh-pages branch ##############
  if [ -z ${exist} ]; then
    ## Render slide
    Rscript -e "rmarkdown::render(\"${file}/index.Rmd\")"
    
    ## Print slide to PDF
    node_modules/.bin/decktape --pause=$pause --size=1024x768 --chrome-arg=--allow-file-access-from-files remark ${file}/index.html ${file}/${file}.pdf
  
  ### When file exist  #########################
  else
    ## Dowload file.pdf from liao961120.github.io into file/file.pdf
    curl -L https://liao961120.github.io/slides/${file}/${file}.pdf -o ${file}/${file}.pdf
    echo "Copied ${file}.pdf from github pages"
    
    ## Dowload index.html from liao961120.github.io into file/index.html
    curl -L https://raw.githubusercontent.com/liao961120/slides/gh-pages/${file}/index.html -o ${file}/index.html
    echo "Copied ${file}/index.html from rawgithub branch gh-pages"
  fi
  
done < list.txt

rm foo.txt
