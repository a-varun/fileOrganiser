#Here, $1 will specify the base folder and $2 will specify the folder to be gone to

cd $2
q=`ls *.*`
for j in ${q}
do
	echo "$j" 
done

p=` ls -l $MYDIR | egrep '^d' | awk '{print $9}' ` 

for dirs in ${p}
do
	cd $1
	sh getextensions.sh $1 $2/$dirs $3 $4
done
cd $2