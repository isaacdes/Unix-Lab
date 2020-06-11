echo "1947214"
echo "Isaac Xavier Desouza"

n=$1
for (( i=1; i<=n; i++ ))
do
	for (( j=n; j>=i; j--))
	do
		echo -n " "
	done
	for (( k=1; k<=i; k++ ))
	do
		echo -n "$i "
	done
	echo ""
done
