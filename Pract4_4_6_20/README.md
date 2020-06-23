# Lab4 Arrays

## Write a shell script to demonstrate the following array related commands and operations
1. DISPLAY ALL ARRAY ELEMENTS
2. DISPLAY ALL ELEMENTS IN A RANGE
3. DISPLAY THE NUMBER OF ARRAY ELEMENTS
4. REPLACE A SUBSTRING IN AN ARRAY ELEMENT
5. SORT AND DISPLAY THE ARRAY ELEMENT IN ASCENDING ORDER AND DESCENDING ORDER
6. COPY AN ARRAY ELEMENTS TO ANOTHER ARRAY 
7. DISPLAY THE SUM AND AVERAGE OF ODD POSITION ELEMENTS AND EVEN POSITION ELEMENTS OF AN ARRAY AND FIND WHICH POSITION NUMBERS ARE HAVING GREATER AVERAGE

## Write a shell script with three array structures to hold the values as given below,
#### Arrray_empl = (Naman Karthik Vishal………)
#### Array_basic = ( 9000 15000 18000………)
#### Array_gross = (0 0 0……..)
####Update the corresponding (based on the array index) gross salary of the employees in the Array_gross according to rule given below,
- If basic salary is &lt; Rs15000 then Gross Salary = basic Salary + 90% of basic salary.
- If basic salary is &gt;=Rs15000 then Gross Salary = basic Salary + 98% of basic salary.

## Code(Program1)
~~~
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
~~~

## Code(Program2)
~~~
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

~~~
