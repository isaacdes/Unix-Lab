# Lab5
1. Write a shell script to count the number of duplicate lines for the given file using function. 

2. Write a shell script to count the number of duplicate files for the given two directories using recursive function. 

3. Write a Shell Script to create a function that accepts name and displays the name entered by the user followed by greeting based on time (Good morning, Good afternoon, Good evening and Good night)

## PRACTICE (Optional)

1. Write a shell script to extract the common and distinct words between two files
	1.  Use two functions for ‘common’ and ‘distinct’
	2. Create one more function to delete the special character in each files
	3. Create function called ‘remove’ for deleting the unnecessary space in each files


#
### Code

~~~
function menu {
	case $1 in 
		1)count_lines;;
		2)count_files;;
		3)greet;;
		0)exit;;
	esac
}

function count_lines {
	ls 
	echo "Enter Filename: "	
	read filename
	echo ""
	echo "Original text in file"
	cat $filename
	echo ""
	num=$( sort $filename | uniq -D | wc -l )
	echo "Total duplicate lines are $num"
	echo "Duplicate lines with number of time occuring:"
	sort $filename | uniq -cd | sort -n
	
}

function count_files() {
	cd 
	ls
	echo "Enter 2 directories "
	read dir1
	read dir2

	array=( $(ls $dir1 -p | grep -v / ) $(ls $dir2 -p | grep -v / ) )
	echo "$dir1 has $(ls $dir1 -p | grep -v / | wc -l) files"
	echo "$dir2 has $(ls $dir2 -p | grep -v / | wc -l) files"
	echo "Duplicate fles in $dir1 and $dir2 are: "
	printf "%s\n" "${array[@]}" | sort | uniq -cd
	echo "Total duplicates are: $( printf "%s\n" "${array[@]}" | sort | uniq -D | wc -l)"
		
	
}

function greet() {
	echo "Enter your name: "
	read name
	time=$(date +%H)
	if [[ $time -ge 6 && $time -lt 12 ]]
	then
		echo "Good Morning $name"
	elif [[ $time -ge 12 && $time -lt 16 ]]
	then
		echo "Good Afternoon $name"
	elif [[ $time -ge 16 && $time -lt 20 ]]
	then
		echo "Good Evevning $name"
	else 
		echo "Good Night $name"
	fi
}

while true 
do
	clear 
	echo "1947214"
	echo "Isaac Xavier Desouza"
	echo "1) To count number of duplicae lines for a given file"
	echo "2) to count no=umber of duplicate files "
	echo "3) To greet user based on time"
	echo "0) Exit"
	read choice
	menu $choice
	echo "Press any key to continue..."
	read
done

~~~
