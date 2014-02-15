#Input is via command line arguments. The first will specify the location of storing files
#Second will specify the base directory the third will specify the extension

cd $1
q=`ls *.$3`
for j in ${q}
do
	echo "Deleting $j"
	rm $j
done

p=` ls -l $MYDIR | egrep '^d' | awk '{print $9}' ` 

for dirs in ${p}
do
	cd $2
	echo "Calling delete on $1/$dirs $2 $3"
	sh del.sh $1/$dirs $2 $3
done

cd $2