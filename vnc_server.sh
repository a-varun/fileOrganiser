
echo "########################################################################"
echo "# # # # # # # # # # # # REMOTE VNC  # # # # # # # # # # # # # # # # # # #"
echo "########################################################################"

echo ""
echo ""

if [ $EUID -ne 0 ]
then
echo "You do not have root privileges."
else
while ( true )
do
echo "1. Install VNC server"
echo "2. Change Password"
echo "3. Uninstall"
echo "4. Start"
echo "5. Stop"
echo "6. Configure "
echo -n "Enter Your Choice : "
read ch
if [ $ch -eq 1 ]
	then
sudo apt-get install tightvncserver
/usr/bin/tightvncserver


touch tightvncserver-init.txt

echo 'USER= "server" '> tightvncserver-init.txt
echo 'eval cd ~$USER'>> tightvncserver-init.txt
echo 'case "$1" in' >> tightvncserver-init.txt
echo '  start)'>> tightvncserver-init.txt
echo '   su $USER -c "/usr/bin/tightvncserver : 1232"' >>tightvncserver-init.txt
echo 'echo "Starting TightVNC server for $USER "'>>tightvncserver-init.txt
echo '   ;;'>>tightvncserver-init.txt
echo ' stop)'>>tightvncserver-init.txt
echo '    pkill Xtightvnc'>>tightvncserver-init.txt
echo '    echo "Tightvncserver stopped"'>>tightvncserver-init.txt
echo '    ;;'>>tightvncserver-init.txt
echo '  *)'>>tightvncserver-init.txt
echo '    echo "Usage: /etc/init.d/tightvncserver {start|stop}"'>>tightvncserver-init.txt
echo '    exit 1'>>tightvncserver-init.txt
echo '    ;;'>>tightvncserver-init.txt
echo ' esac'>>tightvncserver-init.txt
echo 'exit 0'>>tightvncserver-init.txt

echo "Do you want to add this as a startup application?[1/0]"
read stup
if [ $stup -eq 1 ]
then
sudo mv tightvncserver-init.txt /etc/init.d/tightvncserver

sudo chown root:root /etc/init.d/tightvncserver

sudo chmod 755 /etc/init.d/tightvncserver

sudo chmod 755 /etc/init.d/tightvncserver

sudo update-rc.d tightvncserver defaults

fi
elif [ $ch -eq 2 ]
then
	  vncpasswd -t
elif [ $ch -eq 3 ]
then
	sudo apt-get remove tightvncserver
elif [ $ch -eq 8 ]
then
	break
elif [ $ch -eq 4 ]
	then
	vncserver
elif [ $ch -eq 5 ]
then
	vncserver -kill :1232
else
	echo "Invalid choice .... Try Again...."
fi
done
fi