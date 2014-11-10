FROM phusion/baseimage:0.9.15

ENV HOME /root
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]

# when sonarr restarts after an update, it doesn't pass in the -data argument
RUN mkdir /root/.config
RUN ln -s /config /root/.config/NzbDrone

# user sonarr master branch, user can change branch and update within sonarr
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo "deb https://apt.sonarr.tv/ master main" | sudo tee -a /etc/apt/sources.list

RUN apt-get update -q && apt-get install -qy libmono-cil-dev nzbdrone

EXPOSE 8989
VOLUME /config
VOLUME /media

RUN mkdir /etc/service/sonarr
ADD sonarr.sh /etc/service/sonarr/run
ADD sonarr-update.sh /etc/service/sonarr/update.sh
RUN chmod +x /etc/service/sonarr/*
