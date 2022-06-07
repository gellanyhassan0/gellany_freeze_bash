#!/bin/bash

pip install freez

pip3 freeze --all > requirements2.txt

head  args[1]|while read line ; do grep -ioE "import [a-zA-Z0-9]+"|sed 's/import //g';done > test.txt

grep -if test.txt requirements2.txt > requirements.txt
