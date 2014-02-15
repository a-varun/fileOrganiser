while [ true ]
do
clear

echo "#######################################################################################################"
echo "#######################################   HELLO   #####################################################"
echo "#######################################################################################################"

echo "1. Delete the files marked by the given extension."
echo "2. Copy all extensions into a single folder."
echo "3. Advanced options for Copying."
echo "4. Exit"

read n

currdir=`pwd`

if [ $n -eq 1 ]
then
	echo "Enter the extension to be searched and deleted:"
	read ext
	read -e -p "Enter the directory to be worked on:" dirwrkn1
	eval dirwrkn=$dirwrkn1
	sh del.sh $dirwrkn $currdir/ $ext
	echo "Deleted!!!"
elif [ $n -eq 9 ]
then
	echo "Copying video files to ~/Video folder. Enter 1 for proceeding, 0 for stopping or 2 for specifying your own folder."
	read na
	targetdir=~/Videos/
	if [ $na -eq 2 ]
	then
		echo "Enter target folder:"
		read targetdir
	fi
	echo "Enter base folder:"
	if [ $na -eq 1 -o $na -eq 2 ]
	then
		currdir=`pwd`
		echo $currdir
		sh unpack.sh $targetdir $currdir $currdir avi
	fi
	echo "Copying audio files to ~/Music folder. Enter 1 for proceeding, 0 for stopping or 2 for specifying your own folder."
	read na
	targetdir=~/Music/
	if [ $na -eq 2 ]
	then
		echo "Enter base folder:"
		read targetdir
	fi
	if [ $na -eq 1 -o $na -eq 2 ]
	then
		currdir=`pwd`
		sh unpack.sh $targetdir $currdir $currdir mp3
		sh unpack.sh $targetdir $currdir $currdir wav
	fi
elif [ $n -eq 2 ]
then
	echo "Enter the extension to be copied:"
	read extn
	read -e -p "Enter the directory to be worked on:" dirwrkn1
	eval dirwrkn=$dirwrkn1
	read -e -p "Enter the destination directory:" dirdst1
	eval dirdst=$dirdst1
	currdir=`pwd`
	mkdir $dirdst
	sh advanced.sh $dirdst $dirwrkn $currdir/ $extn
elif [ $n -eq 3 ]
then
	echo "Enter the extension to be copied:"
	read extn
	read -e -p "Enter the directory to be worked on:" dirwrkn1
	eval dirwrkn=$dirwrkn1
	read -e -p "Enter the destination directory:" dirdst1
	eval dirdst=$dirdst1
	currdir=`pwd`
	cdn=`basename "$PWD"`
	sh advanced2.sh $dirdst $dirwrkn $currdir/ $extn $cdn
elif [ $n -eq 5 ]
then
	break
else
	echo "Enter a correct value!!!"
fi
done

