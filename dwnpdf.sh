#!/bin/bash

#read -p "Enter file name (without .pdf) > " 
file=${1}

[ -d ${file} ] || echo "Dir ${file} doesn't exist!"

curl -L https://liao961120.github.io/slides/${file}/${file}.pdf -o ${file}/${file}.pdf
echo "Copied ${file}.pdf from github pages"

curl -L https://raw.githubusercontent.com/liao961120/slides/gh-pages/${file}/index.html -o ${file}/index.html
echo "Copied ${file}/index.html from rawgithub branch gh-pages"

