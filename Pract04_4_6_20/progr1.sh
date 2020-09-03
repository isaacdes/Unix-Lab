echo "1947214"
echo "Isaac Xavier Desouza"

echo "Enter array:"
read -a array
temp_array=(this is the new array)

function menu {
        case $1 in
                1)display_all;;
                2)display_range;;
                3)display_num;;
                4)replace_sub;;
                5)sort_arr;;
                6)copy_arr;;
                7)sum_avg;;
                0)exit;;
        esac
}


function display_all {
        echo ${array[*]}
}


function display_range {
        echo "Enter starting index:"
        read start
        echo "Enter ending index"
        read end
        echo -n "Array between index $start and $end : "
        echo ${array[*]:$start:$end}
}

function display_num {
	echo "Number of elements in array: ${#array[*]}"

}

function replace_sub {
	temp_array=(isaac xavier desouza 1947214)
	echo "array is: ${temp_array[@]}"
	echo "enter index: "
	read pos
	echo "Enter Substring: "
	read str
	let pos=$pos-1
	temp_array[$pos]=$str
	echo "Arrayis: ${temp_array[@]}"
}

function sort_arr {
	sorted=( $( printf "%s\n" "${array[@]}" | sort ) )
	echo "Ascending: ${sorted[@]}"
	sorted=( $( printf "%s\n" "${array[@]}" | sort -r ) )
	echo "Descending: ${sorted[@]}"

}

function copy_arr {
	echo "Before copy to new array: ${temp_array[@]}"
	#echo "contents of the array dt wll copy: ${array[@]}"
	temp_array=(${array[@]})
	echo "After copying: ${temp_array[@]}"

}

function sum_avg {
	even_sum=0
	odd_sum=0
	even_cnt=0
	odd_cnt=0

	for i in ${!array[@]}
	do
		if [[ $(($i % 2)) -eq 0 ]]
		then
			let even_cnt=$even_cnt+1
			let even_sum=$even_sum+${array[$i]}
		else
			let odd_cnt=$odd_cnt+1
			let odd_sum=$odd_sum+${array[$i]}
		fi
	done
	even_avg=$(($even_sum / $even_cnt))
	odd_avg=$(($odd_sum / $odd_cnt))
	echo "Odd sum: $odd_avg"
	echo "Even sum: $even_avg"

	if [[ $even_avg -gt $odd_avg ]]
	then
		echo "Even posistions have a greater average"
	else
		echo "Odd positions have a greater average"
	fi

}


#menu
while true
do
	clear
	echo "----Menu----"
	echo "1)Display all array elements"
	echo "2)Display all elements in Range"
	echo "3)Display the number of array elements"
	echo "4)Replace a substring in an array element"
	echo "5)Sort and display array in ascending and descending"
	echo "6)Copy an array elements to another array"
	echo "7)Display the sum and average of odd position elements and even posistion elements of an array and find which posistion numbers are having greater average"
	echo "0)Exit"
	echo "Enter your choice:"
	read choice
	menu $choice
	echo "press any key to continue..."
	read
done


