#!/bin/bash
pandoc -f gfm -c bin/github-pandoc.css -t pdf --pdf-engine=/Library/TeX/texbin/pdflatex rdsv-p32.md -o rdsv-p32.pdf
