#!/bin/bash

if [[ -n $1 && -n $2 ]]
then
	if [[ -e $1 && -e $2 ]]
	then
		dir1="$1"
		dir2="$2"
		for i in `find $dir1 -maxdepth 1 -type f`
		do
			for j in `find $dir2 -maxdepth 1 -type f`
			do
				cmp -s $i $j && echo "$i == $j"
			done
		done
		echo "Files were viewed: $(( `find $dir1 -maxdepth 1 -type f | wc -l`+`find $dir2 -maxdepth 1 -type f| wc -l`))"
	else
		echo "Check if you wrote correct path's">&2
	fi
else
	echo -e "not enough actual parametrs\n1 param - first catalog\n2 param - second catalog">&2
fi

