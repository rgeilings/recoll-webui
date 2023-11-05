FROM  debian:stable-slim

# install important dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip && \    
    apt install python3-waitress

# install recollcmd from recolls programmers website
RUN apt-get install -y --no-install-recommends gnupg
COPY recoll.gpg  /root/recoll.gpg
RUN gpg --import  /root/recoll.gpg
RUN gpg --export '7808CE96D38B9201' | apt-key add -
RUN apt-get install --reinstall -y ca-certificates
RUN apt-get update
RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ bookworm main > \
        /etc/apt/sources.list.d/recoll.list
RUN echo deb-src http://www.lesbonscomptes.com/recoll/debian/ bookworm main >> \
        /etc/apt/sources.list.d/recoll.list
RUN apt-get install  -y --no-install-recommends recollcmd python3-recoll
RUN apt autoremove

RUN apt-get clean

RUN mkdir /data && mkdir /root/.recoll

COPY sw_recoll.conf /usr/share/recoll/examples/recoll.conf

WORKDIR /recollwebui

COPY recollwebui . 

EXPOSE 8080

CMD ["/usr/bin/python3", "/recollwebui/webui-standalone.py", "-a", "0.0.0.0"]
 