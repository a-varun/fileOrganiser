#$1 will specify the target folder, $2 will specify the folder to be gone, $3 is the base folder, $4 is the extension

echo "$2"
cd "$2"
ls *.$4|
while read j
do
	echo "Copying $j to $1"
	cp "$j" "$1"
done
flags=1
ls -l -p $MYDIR | egrep '^d' | awk '{print $9}'|
while read dir
	do
	echo $dir
	if [ $flags -eq 1 ]
	then
		flags=3;
		continue;
	fi
	echo sh advanced.sh "$1" "$2/$dirs" "$3" "$4"
	cd "$3"
	sh advanced.sh "$1" "$2/$dir" "$3" "$4"
done
cd "$3"
