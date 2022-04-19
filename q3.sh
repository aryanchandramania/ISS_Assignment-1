#!/bin/bash
read filename
ls -l $filename | cut -d " " -f5

echo "=============================================="

wc -l < $filename

echo "=============================================="

wc -w < $filename

echo "=============================================="

i=0
while read line
do 
	((i++))
	echo -n Line No:"$i"-Count of words:
	wc -w <<< "$line"
done < $filename

echo "=============================================="

nn="."
xx="!"
yy="?"
zz="~"
ww=","
vv=";"
uu=":"
gg="-"
emp=" "
tr ' ' '\n' < $filename > tmp.txt
tr '...' '\n' < tmp.txt > m.txt
sed '/^$/d' m.txt > tmp.txt
rm m.txt
declare -A arr
while read -r line
do
	line=${line##"$zz"} #tilde
	line=${line%%"$zz"}
	line=${line%%"$nn"} #period
	line=${line%%"$gg"} #hyphen
	line=${line%%"$xx"} #exclamation mark
	line=${line%%"$vv"} #semicolon
	line=${line%%"$uu"} #colon
	line=${line%%"$yy"} #question mark
	line=${line%%"$ww"} #comma
	echo $line >> aryan.txt
done < tmp.txt
sed -i '/^$/d' aryan.txt

while read -r line
do arr[$line]=0; done < aryan.txt

while read -r line
do arr[$line]=$(( ${arr[$line]} + 1)); done < aryan.txt

while read -r line 
do
	if [ ${arr[$line]} -gt 1 ]
	then
		echo "Word:${line}-Count of repitition:${arr[$line]}"
		arr[$line]=0
	fi
done < aryan.txt
rm aryan.txt
rm tmp.txt
