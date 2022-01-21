#!/bin/bash

# Use GNU Guix to create an environment where python-gdal runs our script.
# See https://guix.gnu.org/
#
guix environment --pure --ad-hoc python python-gdal -- python3 ./gdal-example.py
