FROM ubuntu:14.04
MAINTAINER Sarfaraz Ali Khan <mrkhan1417@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4 gnome-icon-theme-full tango-icon-theme xfce4-terminal tightvncserver

ENV USER root
EXPOSE 5901

COPY start.sh /opt/
RUN chmod +x /opt/start.sh
CMD ["/opt/start.sh"]
