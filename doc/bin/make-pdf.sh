#!/bin/bash
pandoc -f gfm -c github-pandoc.css --pdf-engine=wkhtmltopdf rdsv-p32.md -o rdsv-p32.pdf
