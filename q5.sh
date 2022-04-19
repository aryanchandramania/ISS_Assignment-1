#!/bin/bash

read string
len=${#string}
for ((i=$len-1; i>-1; i--))
do
	echo -n "${string:$i:1}"
done
echo "========================================="

for ((i=0; i<len; i++))
do
	n=$(printf "%d" "'${string:$i:1}'")
	((n++))
	if [ $n -eq 91 ]; then
		n=65
	fi
	if [ $n -eq 123 ]; then
		n=97
	fi
	printf -v c "\\$(printf %o $n)"
	echo -n $c
done
echo "======================================="

for ((i=$len/2-1; i>-1; i--))
do
	echo -n "${string:$i:1}"
done

for ((i=len/2; i<len; i++))
do
	echo -n "${string:$i:1}"
done

echo -n $'\n'
