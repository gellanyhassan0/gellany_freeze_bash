#!/bin/bash

pip install freez

pip3 freeze --all > requirements2.txt

#head $1|while read line ; do grep -ioE "import [a-zA-Z0-9]+"|sed 's/import //g'|sed -e 's/^/\^/';done > test.txt
#cat test.txt|while read line;do grep -iE $line requirements2.txt;done > requirements.txt

sort $1|while read line ; do grep -ioE "import [a-zA-Z0-9]+|from [a-zA-Z0-9]+"|sed 's/import //g; s/from //g'|sed -e 's/^/\^/'|while read lineB;do grep -siE --no-filename $lineB requirements2.txt 2>/dev/null;done;done > requirements1.txt 

sort -u requirements1.txt|tee requirements.txt
