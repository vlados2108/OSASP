if [[ -n $1 && -n $2 &&  -n $3 ]]
then
	if [[  -e $1  && -e $2 && $3="." ]]
	then
		output=$1
		path=$2
		ext=$3
		exec 1>$output
		find "$path" -type f -name "*"$ext|sort
	else
		echo "syntax error;make shure you wrote correct path|filename|extension">&2
	fi
else
	echo "not enough parametrs">&2
	echo "1 param - output file">&2
	echo "2 param - path to the directory with files">&2
	echo "3 param - extension">&2
fi


