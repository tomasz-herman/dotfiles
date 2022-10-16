#!/bin/sh

sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}' | sort -nr | head -n 1 | sed 's/$/°C/'
