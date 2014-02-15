#the $1 will specify tgt, $2 will specify current dir, $3 the base dir, $4 the extension, $5 the previous dir

mkdir $1
cd $2
fl=0
fil=$1/$5
q=`ls *.$4`
for j in ${q}
do
	fl=1
	mkdir $fil
	echo "Copying $j to $1"
	cp $j $fil
done

p=` ls -l -p $MYDIR | egrep '^d' | awk '{print $9}' ` 

for dirs in ${p}
do
	cd $3
	echo "calling sh unpack.sh $1/$dirs $2$dirs $3 $4"
	if [ $fl -eq 1 ]
	then
		flip=$1/$5
	else
		flip=$1
	fi
	sh advanced2.sh $flip $2/$dirs $3 $4 $dirs
done
cd $3