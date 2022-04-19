#!/bin/bash
nn="."
xx="!"
# pre processing
sed '/^$/d' -i quotes.txt
awk '{if (++dup[$0] == 1) print $0;}' quotes.txt > out2.txt
rm quotes.txt
mv out2.txt quotes.txt
# end pre processing
IFS=$'\n'
space=" "
while read -r line 	
do
	IFS="~"
	echo "$line" > temp.txt
	read quote person < temp.txt
	quote=${quote//. /$nn}
	quote=${quote//! /$xx}
	person=${person##"$space"}
	echo "$person" once said, \""$quote"\" >> t.txt
	IFS=$'\n'
	rm temp.txt
done < quotes.txt
mv t.txt speech.txt
