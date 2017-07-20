#!/bin/bash

if [ -z "$PASS" ]
then
      PASSWORD=zpassword
else
      PASSWORD=$PASS
fi

mkdir $HOME/.vnc
echo $PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd

mkdir -p $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
cp /zvnc/xsettings.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
cp /zvnc/xfwm4.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
cp /zvnc/xstartup $HOME/.vnc/xstartup
chmod 755 $HOME/.vnc/xstartup

rm /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver :1 -geometry 1366x768 
tail -F $HOME/.vnc/*.log
