#!/bin/bash

#read -p "Enter file name (without .pdf) > " 
file=${1}

[ -d ${file} ] || echo "Dir ${file} doesn't exist!"

curl -L https://liao961120.github.io/slides/${file}/${file}.pdf -o ${file}/${file}.pdf
