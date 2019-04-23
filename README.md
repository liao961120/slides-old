[![Build Status](https://travis-ci.org/liao961120/slides.svg?branch=master)](https://travis-ci.org/liao961120/slides)

This repo is dormant now. It is a cool idea to build & print slides on Travis, but besides this, there are no other utilities. I now manage my slides at https://github.com/liao961120/slides.


# Repo for Slides

This was where I put my HTML slides.  
The slides are generated and deployed to my web page by Travis-CI. 
By setting up Travis-CI, I only have to update the source Rmd file and push the changes to GitHub without knitting them locally.

I also set up [decktape](https://github.com/astefanutti/decktape) to print HTML slides to PDF after they are built. Have a look at files below to see how this is achieved.

- [.travis.yml](https://github.com/liao961120/slides/blob/master/.travis.yml)
- [list.txt](https://github.com/liao961120/slides/blob/master/list.txt): Slide directory names and date
- [build-slide.sh](https://github.com/liao961120/slides/blob/master/build-slide.sh): Build and print new slide; download previously rendered slides
- [after-knit.sh](https://github.com/liao961120/slides/blob/master/after-knit.sh): Write [web page](https://liao961120.github.io/slides) to link to slides

## Steps to Update Slides

1. Put xaringan source files (Rmd, macro.js, etc) in a subdirectory under this repo
1. Write (or edit) source Rmd file
1. Add new entries in `list.txt`
1. Push to GitHub
