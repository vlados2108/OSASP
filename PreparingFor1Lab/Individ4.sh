#!/bin/bash

if [[ -n $1 && -n $2 ]]
then
	if [[ -e $1 && -e $2 ]]
	then
		dir1="$1"
		dir2="$2"
		ls $dir1/ > 444
		ls $dir2/ > 555
		count1=`cat 444 | wc -l`
		count2=`cat 555 | wc -l`
		for i in $(seq 1 $count1)
		do
			var1=`sed -n $i"p" 444`
			pathfile1="$dir1/$var1"
			for j in $(seq 1 $count2)
			do
				var2=`sed -n $j"p" 555`
				pathfile2="$dir2/$var2"
				cmp -s "$pathfile1" "$pathfile2" 
				if [ $? -eq 0 ]
				then
					echo "$var2 == $var2"
				fi
			done
		done
		rm -f 444 555		
	else
		echo "Check if you wrote correct path's">&2
	fi
else
	echo "not enough actual parametrs">&2
	echo "1 param -  first catalog">&2
	echo "2 param - second catalog">&2
fi

