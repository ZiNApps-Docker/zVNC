FROM ubuntu
MAINTAINER Sarfaraz Ali Khan <mrkhan1417@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4 xfce4-terminal tightvncserver
RUN apt-get install software-properties-common -y

# Themes and icons
RUN add-apt-repository -y ppa:snwh/pulp; add-apt-repository -y ppa:tista/adapta
RUN apt update
RUN apt-get install paper-icon-theme paper-cursor-theme adapta-gtk-theme -y


ENV USER root
EXPOSE 5901

RUN mkdir ~/.vnc
RUN echo password | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

COPY xsettings.xml /root/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
COPY xfwm4.xml /root/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml

COPY xstartup /root/.vnc/xstartup
RUN chmod 755 /root/.vnc/xstartup

COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
CMD ["/opt/start.sh"]
