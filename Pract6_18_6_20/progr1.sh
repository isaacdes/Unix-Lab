function change_owner {
	echo "Files presnt with long listed"
	ls -l
	echo "Present owners are: "
	echo $(getent passwd | awk -F: '{print $1}' )
	echo "Select an owner: "

	read owner
	echo "Name of the file to change owner of: "
	read filename

	sudo chown $owner $filename
	if [[ $? -eq 0 ]]
	then
		echo "Operation was successfull"
		echo $(ls -l $filename)
	else
		echo "Operation failed"
	fi
}

function change_group_user {
	echo "Add temporary group"
	read grp
	echo "Adding $grp as group"
	sudo groupadd $grp
	echo "Enter username for the said group:"
	read user
	echo "Adding $user to $grp group..."
	sudo usermod -a -G $grp $user

	if [[ $? -eq 0 ]] 
	then
		echo "Operation was successfull"
		echo $(groups $user)
	else
		echo "Operation failed"
	fi
}

function change_file_permission {
	echo "Enter dir:"
	read dir_name
	echo "Enter permission number:"
	read perm
	chmod -R $perm $dir_name
	if [[ $? -eq 0 ]]
	then
		echo "Operation was successfull"
		ls -l $dir_name 
	else
		echo "Operation failed..."
	
	fi
}

function method4 {
	echo "Enter the role you want: "
	echo "1. Administrator"
	echo "2. student"
	echo "3. Faculty"
	read role
	
	echo "1. Create a file"
	echo "2. Existinng file"
	read op
	case $op in
		1) echo "Enter filename"
			read filename
			touch $filename;;
		2)echo "List of files present"i
			ls -l
			echo "enter filename"
			read filename;;
	esac

	case $role in 
		1) chmod u=rwx $filename;;
		2) chmod u=r $filename;;
		3) chmod u=rw $filename;;
	esac
	ls -l $filename
}

function method5 {
	ls
	echo "Enter the zipfile name:"
	read zip_nm
	echo "Zipping all .txt files"
	zip $zip_nm *.txt
	ls 
}

function method6 {
	cd 
	echo "Arching files that are older than 3 months"
	find . -mtime +90 | xargs zip threeMonthsOld.zip

}

function method7 {
	pwd
	ls
	echo "Enter the starting charcter you want"
	read st
	tar -cvf compression.tar $st*
	ls
}

function method8 {
	echo "Archiving files larger than 1GB"
	cd
	find / -type f -size + 1000000k -exec ls -lh {} \; | awk '{print $9 ": " $5 }' zip moreth1GB.zip
	ls
}

function method9 {
	echo "Enter permission"
	read perm
	find -perm $perm | zip -r outputOf9
}

while [[ true ]]
do
	clear
	echo "1. To change the ownership of a file"
	echo "2. To change the group of a file"
	echo "3. The recursive option to assign file permission"
	echo "4. Assign the file privilleges at the time of creating a file based on the Roles"
	echo "5. Group and Compress the file based on their extension"
	echo "6. Archive the files which are not accessed for past three months"
	echo "7. Move all the files starting with a specific character"
	echo "8. Compress the files from the current directory which consume more than 1gb"
	echo "9. Group and compress the files based on their file permission"

	read choice
	case $choice in
		1)change_owner;;
		2)change_group_user;;
		3)change_file_permission;;
		4)method4;;
		5)method5;;
		6)method6;;
		7)method7;;
		8)method8;;
		9)method9;;
		0)exit;;
	esac
	echo "Enter key to continue..."
	read
done
