# Lab8(AWK)

##   1. Create a text file of your choice and execute the following:
awk -f program-file input-file
awk '{ print $3 }' input file
awk '/0.5/ { print $1 }' input file
awk '/^[0-9][0-9]/ { print $1 }' input file
awk '$2 ~ /ia/ { print $1 }' input file
awk '$2 !~ /ia/ { print $1 }' input file
awk '$3 > 50 { print $1 }' input file
awk '$4 == 31, $4 == 33 { print $0 }' input file
awk 'BEGIN { print "Start Processing." }; { print $3 }; END { print "End Processing." }' input file
awk 'BEGIN { FS = "." } { print $1 }' input file

## 2. Prepare a single Awk command, to make a copy of this CSV file, nameemailavg.csv (which attached with the program), the input is a comma separated file, with three fields. The output should be the same, but tab-separated.  
{Hint: Learn Field, Line Separators with variables}

