#$1 will specify the target folder, $2 will specify the folder to be gone, $3 is the base folder, $4 is the extension

cd $2
q=`ls *.$4`
for j in ${q}
do
	echo "Copying $j to $1"
	cp $j $1
done

p=` ls -l $MYDIR | egrep '^d' | awk '{print $9}' ` 

for dirs in ${p}
do
	cd $3
	echo "calling sh advanced.sh $1 $2$dirs $3 $4"
	echo "sh advanced.sh $1 $2/$dirs $3 $4"
	sh advanced.sh $1 $2/$dirs $3 $4
done
cd $3
