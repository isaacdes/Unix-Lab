echo "1947214"
echo "Isaac Xavier Desouza"
n=$1
for (( i=1; i<=n; i++))
do
	for (( j=1; j<=i; j++))
	do
		echo -n "*"
	done
	echo ""
done
for (( i=n; i>=1; i--))
do
	for (( j=1; j<=i; j++))
	do
		echo -n "*"
	done
	echo ""
done
