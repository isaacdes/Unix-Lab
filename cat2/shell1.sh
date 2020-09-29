echo "Isaac Xavier Desouza"
echo "1947214"

echo ""
read -p "Enter a String: " word
len=${#word}
echo "Length: $len"

for ((i=0; i<$len; i++))
do
	for (( j=0; j<=$i; j++))
	do
		echo -n "${word:$j:1}"
	done
	echo ""
done
