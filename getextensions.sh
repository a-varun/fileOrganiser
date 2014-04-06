#Here, $1 will specify the base folder and $2 will specify the folder to be gone to

cd "$2"
ls *.*|
while read j
do
	echo "$j" 
done
flags=1
find "$MYDIR"-maxdepth 1 -type d|
while read dir
	do
	if [ $flags -eq 1 ]
	then
		flags=3;
		continue;
	fi
	cd "$1"
	sh getextensions.sh "$1" "$2/$dir" "$3" "$4"
done
cd "$2"