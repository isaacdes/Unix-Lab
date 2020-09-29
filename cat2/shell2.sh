echo "Isaac Xavier Desouza"
echo "1947214"
echo ""

read -p "Enter a Number: " num

stp=$(( $num*2 - 1))
ptr=$(($num))
echo "$stp"
middle=0
for (( j=$(($num)); j>=2; j--))
do
	for (( k=1; k<=$j; k++ ))
	do
		echo -n "$ptr"
	done
	echo ""
	ptr=$((ptr-2))
       if [[ $ptr -lt 0 ]]
       then
		
	       	
		middle=$((ptr))
		ptr=0
       fi
	       
done
echo "$middle"

