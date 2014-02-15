while [ true ]
do

clear;
echo
echo

echo
echo
echo
echo
echo

echo "#######################################################################################################"
echo "#######################################   HELLO   #####################################################"
echo "#######################################################################################################"

echo "1. Delete the files marked by the given extension."
echo "2. Clone the files to the base folder."
echo "3. Copy all extensions into a single folder."
echo "4. Advanced options for Copying."
echo "5. Exit"

read n


currdir=`pwd`

if [ $n -eq 1 ]
then
	echo "Enter the extension to be searched and deleted:"
	read ext
	sh del.sh $currdir $currdir $ext
	echo "Deleted!!!"
elif [ $n -eq 2 ]
then
	read -e -p "Enter target folder:" targetdir1
	eval targetdir=$targetdir1

	echo "Copying video files. Enter 1 for proceeding, 0 for stopping:"
	read na
	if [ $na -eq 1 ]
	then
	read -e -p "Enter target folder:" targetdir1
	eval targetdir=$targetdir1
	read -e -p "Enter destination folder for music:" folder1
	eval folder=$folder1

	currdir=`pwd`
	echo $currdir
	sh unpack.sh $targetdir $folder $currdir avi
	sh unpack.sh $targetdir $folder $currdir mkv
	sh unpack.sh $targetdir $folder $currdir mp4
	fi
	echo "Copying audio files to ~/Music folder. Enter 1 for proceeding, 0 for stopping:"
	read n
	if [ $n -eq 1 ]
	then
	read -e -p "Enter destination folder for music:" folder1
	eval folder=$folder1
	currdir=`pwd`
	sh unpack.sh $targetdir $folder $currdir mp3
	sh unpack.sh $targetdir $folder $currdir wav
	fi
elif [ $n -eq 3 ]
then
	echo "Enter the extension to be copied:"
	read extn
	read -e -p "Enter the directory to be worked on:" dirwrkn1
	eval dirwrkn=$dirwrkn1
	read -e -p "Enter the destination directory:" dirdst1
	eval dirdst=$dirdst1
	currdir=`pwd`
	sh advanced.sh $dirdst $dirwrkn $currdir/ $extn
elif [ $n -eq 4 ]
then
	echo "Enter the extension to be copied:"
	read extn
	read -e -p "Enter the directory to be worked on:" dirwrkn1
	eval dirwrkn=$dirwrkn1
	read -e -p "Enter the destination directory:" dirdst1
	eval dirdst=$dirdst1
	currdir=`pwd`
	sh advanced.sh $dirdst $dirwrkn $currdir/ $extn
	cdn=`basename "$PWD"`
	sh advanced2.sh $dirdst $dirwrkn $currdir $extn $cdn
elif [ $n -eq 5 ]
then
	break
else
	echo "Enter a correct value!!!"
fi
done

