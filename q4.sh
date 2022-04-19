#!/bin/bash

IFS=,
read -a arr

len=${#arr[@]}

flag=0

for (( i=0; i<$len-1; i++ ))
do
        for (( j=0; j<$len-1-$i; j++ ))
        do
                if [[ ${arr[$j]} -gt ${arr[$j+1]} ]];
                then
                        temp=${arr[$j]};
                        arr[$j]=${arr[$j+1]};
                        arr[$j+1]=$temp;
                        flag=1;
                fi
        done

        if [[ flag -eq 0 ]];
        then
                break;
        fi
done

for (( i=0; i<$len; i++ ))
do
        printf "%d " "${arr["$i"]}"
done
printf "\n"
