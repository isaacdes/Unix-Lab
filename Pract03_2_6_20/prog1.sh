echo  "1947214"
echo "Isaac Xavier Desouza"
if [[ $# -eq 0 ]]
then
	echo "Error, insufficient arguments"
else
	if [[ $1 -gt $2 ]]
	then
		if [[ $1 -gt $3 ]]
		then
			echo "1st arg is largest: $1"
		else
			echo "3rd srg is largest: $3"
		fi
	else
		if [[ $2 -gt $3 ]]
		then
			echo "2nd arg is largest: $2"	
		else
			echo "3rd arg is greatest: $3"
		fi
	fi
fi
