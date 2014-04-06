#In file, the $1 is the source directory, $2 is the destination  directory and $3 is the extension to be copied
currdir=`pwd`
cdn=`basename "$PWD"`
mkdir $2
echo "mkdir $2" >> log.txt
sh advanced2.sh "$2" "$1" "$currdir/" "$3" "$3"
notify-send "File transfer" "Finished copying the extension $3" -t 4