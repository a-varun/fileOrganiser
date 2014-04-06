#the $1 will specify tgt, $2 will specify current dir, $3 the base dir, $4 the extension, $5 the previous dir

mkdir $1
cd $2
fl=0
fil=$1/$5
ls *.$4|
while read j
do
	fl=1
	mkdir $fil
	echo "Copying $j to $1"
	cp $j $fil
done
flirli=1
find "$MYDIR"-maxdepth 1 -type d|
while read dir
	do
		echo $dir
done
