#!/bin/bash
sed '/^$/d' quotes.txt
echo "=========================================================="
awk '{if (++dup[$0] == 1) print $0;}' quotes.txt
