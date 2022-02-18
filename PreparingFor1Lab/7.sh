#!/bin/bash
if [[ -n "$1" && -n "$2" ]]
then 
if [ -e "$1" ]
then
	file="$1"
	exe="$2"
	if [ -e "$file" ]
	then
		if  gcc "$file" -o "$exe"
		then
			./"$exe"
		else
			echo "Compilation error">&2
			exit
		fi

	else
		echo ""
	fi
else
	echo "Syntax error:check if your file $1 exists">&2
fi
else
        echo "There must be 2 params">&2
        echo "1 param - file to compile">&2
        echo "2 param - exe-file">&2

fi
