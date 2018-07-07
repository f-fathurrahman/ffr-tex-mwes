#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo
  echo "ERROR"
  echo "Need exactly one parameter: LaTeX source file in *.tex extension"
  echo
  exit 1
fi

basnam=`basename $1 .tex`

if [ $basnam == "$1" ]; then
  echo "Error: file name does not have *.tex"
  exit 1
fi

# Alternative way to check extension
# if [[ $file == *.txt ]]  # check extension

for fil in $basnam-*.asy
do
  asy $fil
done

pdflatex $1
pdflatex $1
