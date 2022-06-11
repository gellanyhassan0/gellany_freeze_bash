#!/bin/bash

pip install freez

pip3 freeze --all > requirements2.txt

find $1 -type f -name "*.py"|while read line ; do cat $line|grep -ioE "import [a-zA-Z0-9]+"|sed 's/import //g'|sed -e 's/^/\^/'|while read lineB;do grep -siE --no-filename  $lineB requirements2.txt 2>/dev/null;done;done|tee requirements.txt
