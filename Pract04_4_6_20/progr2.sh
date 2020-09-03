echo "1947214"
echo "Isaac Xavier Desouza"

echo "Enter total entries: "
read n
#let n=$n-1
empy=()
basic=()
gross=()
for (( i=0; i<$n; i++ ))
do
	echo "Emp Name:"
	read nm
	empy[$i]=$nm
	echo "Emp basic salary"
	read sal
	basic[$i]=$sal
	gross[$i]=0
	echo ""
done

#empy=(Isaac Swaraj Neil Eric)
#basic=(9000 15000 18000 20000)
#gross=(0 0 0 0 )

for i in ${!gross[@]}
do
	j=basic[$i]
	if [[ $j -lt 15000 ]]
	then
		sal=$(($j*90 / 100))
		gros_sal=$(($j + $sal))
		gross[$i]=$gros_sal

	else	
		sal=$(($j*98 / 100))
		gros_sal=$(($j + $sal))
		gross[$i]=$gros_sal	
	fi
done

echo "-----------------------"
for i in ${!empy[@]}
do
	echo "Employee ${empy[$i]} salary is: ${gross[$i]}"
done


