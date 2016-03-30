FROM ubuntu:14.04
MAINTAINER vadim@grinco.eu
RUN apt-get update && apt-get install -y python-pip && pip install python-dockercloud
ADD http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /usr/bin/btsync.tar.gz
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz
RUN mkdir -p /btsync/.sync
EXPOSE 55555
ADD start-btsync /usr/bin/start-btsync
RUN chmod +x /usr/bin/start-btsync
ENTRYPOINT ["start-btsync"] 
