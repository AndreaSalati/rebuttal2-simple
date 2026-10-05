#!/bin/bash

# aux files go to build/, the PDF next to main.tex (see latexmkrc)
latexmk -pdf -interaction=nonstopmode main.tex
