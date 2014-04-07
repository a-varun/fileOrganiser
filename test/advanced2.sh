#the $1 will specify tgt, $2 will specify current dir, $3 the base dir, $4 the extension, $5 the previous dir

mkdir $1
cd "$2"
echo `ls`
fl=0
fil=$1/$5
echo "ls *.$4"
ls *.$4|
while read j
do
	fl=1
	mkdir "$fil"
	echo "Copying $j to $1"
	cp "$j" "$fil"
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
	echo $dir "Outside if"
	cd "$3"
	if [ $fl -eq 1 ]
	then
		flip=$1/$5
	else
		flip=$1
	fi
	echo sh advanced2.sh "$flip" "$2/$dir" "$3" "$4" "$dir"
	sh advanced2.sh "$flip" "$2/$dir" "$3" "$4" "$dir"
done
cd "$3"