[![Build Status](https://travis-ci.org/liao961120/slides.svg?branch=master)](https://travis-ci.org/liao961120/slides)

# Repo for Slides

This is where I put my HTML slides.  
The slides are generated and deployed to my web page by Travis-CI. 
By setting up Travis-CI, I only have to update the source Rmd file and push the changes to GitHub without knitting slides to HTML locally.

I also set up [decktape](https://github.com/astefanutti/decktape) to print HTML slides to PDF after they are built. Have a look at files below to see how this is achieved.

- [.travis.yml](https://github.com/liao961120/slides/blob/master/.travis.yml)
- [list.txt](https://github.com/liao961120/slides/blob/master/list.txt): Slide directory names and date
- [build-slide.sh](https://github.com/liao961120/slides/blob/master/build-slide.txt): Build and print new slide; download previous rendered slides
- [after_knit.sh](https://github.com/liao961120/slides/blob/master/after_knit.sh): Write [web page](https://liao961120.github.io/slides) to link to slides

## Steps to Update Slides

### The First Time

1. Write xaringan slides in Rmd
1. knit it (only the first time is needed, so dependencies can be generated)
1. Add new entries in `list.txt`
1. Push to GitHub

### Later

1. Update xaringan slides in Rmd
1. Push it to GitHub