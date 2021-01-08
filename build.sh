#!/bin/sh
# ./build.sh <input rst filename> <output filename> <margins>
# a `pandoc.css` file must be provided
MARGINS="$3"
REGEX="^[0-9]+$"
if ! [[ $MARGINS =~ $REGEX ]]; then
    MARGINS=15
fi
if [[ -n $2 ]]; then
    pandoc "$1" -f rst -t html5 -o "$2" --css pandoc.css -V margin-top=$MARGINS -V margin-bottom=$MARGINS -V margin-left=$MARGINS -V margin-right=$MARGINS
else
    # direct console output
    pandoc "$1" -f rst -t html5
fi