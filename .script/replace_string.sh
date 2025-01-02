#!/usr/bin/env bash

# This will replace all instances of a string in folder names, filenames,
# and within files.  Sometimes you have to run it twice, if directory names change.


# Example usage:
# replace_string apple banana

echo $1
echo $2

ESCAPED_FIND=$(printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g')
ESCAPED_REPLACE=$(printf '%s\n' "$2" | sed -e 's/[\/&]/\\&/g')

find ./ -type f -exec sed -i -e "s/$ESCAPED_FIND/$ESCAPED_REPLACE/g" {} \;    # rename within files
find ./ -type d -exec perl-rename "s/$ESCAPED_FIND/$ESCAPED_REPLACE/g" {} \;  # rename directories
find ./ -type f -exec perl-rename "s/$ESCAPED_FIND/$ESCAPED_REPLACE/g" {} \;  # rename files
