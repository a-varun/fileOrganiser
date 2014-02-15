#Input is via command line arguments. The first will specify the location of storing files
#Second will specify the base directory

cd $2
mkdir $1
q=`ls *.$4`
for j in ${q}
do
	echo "Copying $j to $1"
	cp $j $1
done

p=` ls -l $MYDIR | egrep '^d' | awk '{print $9}' ` 

for dirs in ${p}
do
	mkdir $1/$dirs
	cd $3
	echo "Creating a directory $1$dirs"
	echo "calling sh unpack.sh $1/$dirs $2$dirs $3 $4"
	sh unpack.sh $1/$dirs $2/$dirs $3 $4
done

cd $3