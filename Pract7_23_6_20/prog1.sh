function method1 {
	echo "Available text files"
	ls *.txt

	echo ""
	echo "Enter filename: "
	read filename
	
	echo ""
	echo "Displaying file contents with line number"
	cat -n $filename
	
	echo ""
	vowels=$(grep -o [aeiouAEIOU] $filename | wc -l)
	echo "No of vowels: $vowels"

	unique=$(cat $filename | tr " " "\n" |sort | uniq -u | wc -l)
	echo ""
	echo "Displaying the unique words:"
	cat $filename | tr " " "\n" | sort | uniq -u
	echo "Total number of unique words: $unique"
}

function method2 {
	echo "Available text documents:"
	ls *.txt

	echo ""
	echo "Enter the filename:"
	read filename

	echo "Frequency of chars:"
	grep -o "\w" $filename | sort | uniq -c | sort -n

	ch=$(grep -o "\w" $filename | sort | uniq -c | sort -nr |head -n 1 | grep -o "[a-zA-Z]")
	echo "The char that occurs max number of times is: $ch"

	echo ""
	echo "Enter a filename to store the max frequency of chars:"
	read file

	echo $(grep -o "\w" $filename |sort |uniq -c | sort -nr | head -n 1) > $file

	echo ""
	echo "Displaying the contents of file $file"
	cat  $file


}

function method3 {
	echo "Available text files:"
	ls *.txt

	echo
	echo "Enter filename"
	read filename

	echo "Displaying the contents of $filename:"
	echo "---"
	cat $filename
	echo "---"

	sed -i 's/University/(Deemed to be University)/g' $filename
	
	echo ""
	echo "Displaying the contents of $filename after rectifying:"
	echo "---"
	cat $filename
	echo "---"

	sed -i 's/(Deemed to be University)/University/g' $filename
}

function menu {
	case $1 in
		1) method1;;
		2) method2;;
		3) method3;;
		4) method4;;
		0) exit;;
	esac
}

while true
do
	clear
	echo "Isaac Xavier Desouza"
	echo "1947214"
	echo "1) Count number of unique words and vowels in a file along with line number"
	echo "2) Frequency of occurrence of each character present in the text document and display the character which has the maximum frequency of occurrences "
	echo "3) To replace Christ University as CHRIST(Deemed to be University)"
	echo "0) Exit"
	read choice
	menu $choice
	echo "Press any key to continue..."
	read
done


