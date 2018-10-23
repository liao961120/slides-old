[![Build Status](https://travis-ci.org/liao961120/slides.svg?branch=master)](https://travis-ci.org/liao961120/slides)

# Repo for Slides

This is where I put my HTML slides.  
The slides are generated and deployed to my web page by Travis-CI. 
By setting up Travis-CI, I only have to update the source Rmd file and push the changes to GitHub without knitting slides to HTML locally.

I also set up [decktape](https://github.com/astefanutti/decktape) to print HTML slides to PDF after they are built. Have a look at

    - [.travis.yml](https://github.com/liao961120/slides/blob/master/.travis.yml)
    - [after_knit.sh](https://github.com/liao961120/slides/blob/master/after_knit.sh)
    - [list.txt](https://github.com/liao961120/slides/blob/master/list.txt)
    - [dwnpdf.sh](https://github.com/liao961120/slides/blob/master/dwnpdf.sh): bash script to download deployed PDF

 to see how this is achieved.