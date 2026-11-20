#!/bin/bash
pandoc -f gfm -c bin/github-pandoc.css -t docx rdsv-p32.md -o rdsv-p32.docx
