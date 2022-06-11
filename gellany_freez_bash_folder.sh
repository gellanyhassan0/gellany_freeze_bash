#!/bin/bash

pip install freez

pip3 freeze --all > requirements2.txt

#head $1|while read line ; do grep -ioE "import [a-zA-Z0-9]+"|sed 's/import //g'|sed -e 's/^/\^/';done > test.txt
#cat test.txt|while read line;do grep -iE $line requirements2.txt;done > requirements.txt

find $1 -type f -name "*.py"|while read line ; do sort $line  manage.py|while read line ; do grep -ioE "import [a-zA-Z0-9]+"|sed 's/import //g'|sed -e 's/^/\^/'|while read lineB;do grep -iE $lineB requirements2.txt;done;done;done > requirements1.txt

sort -u requirements1.txt  > requirements.txt
