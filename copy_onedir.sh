#in this script, the $1 is the source directory and the $2 is the destination directory and $3 is the extension
currdir=`pwd`
mkdir "$2"
mkdir "$2/$3"
echo "mkdir $2" >> log.txt;
echo "mkdir $2$3" >> log.txt;
echo "sh advanced.sh $2$3 $1 $currdir/ $3" >>log.txt;
sh advanced.sh "$2/$3" "$1" "$currdir/" "$3"
notify-send "File transfer" "Finished copying the extension $3" -t 4