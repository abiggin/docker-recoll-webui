FROM  ubuntu:20.10
LABEL author="alistair.biggin@gmail.com"

# install important dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip git && \
    pip3 install waitress

# install recollcmd from recolls programmers website
RUN apt-get install -y --no-install-recommends gnupg
COPY recoll.gpg  /root/recoll.gpg
RUN gpg --import  /root/recoll.gpg
RUN gpg --export '7808CE96D38B9201' | apt-key add -
RUN apt-get install --reinstall -y ca-certificates
RUN apt-get update -y
RUN apt-get install  -y --no-install-recommends recoll
RUN apt-get install  -y --no-install-recommends recollcmd python3-recoll
RUN apt autoremove

# install additional dependencies and software here
RUN apt-get install -y --no-install-recommends poppler-utils
RUN apt-get install -y --no-install-recommends unrtf antiword
RUN apt-get install -y --no-install-recommends unzip
RUN apt-get install -y --no-install-recommends  aspell
RUN apt-get update
RUN apt-get clean


# recoll config file
RUN mkdir /root/recoll
COPY recoll.conf /root/.recoll/recoll.conf

# start script
COPY go.sh /root/go.sh
RUN chmod 0755 /root/go.sh

# install crontab
RUN apt-get update
RUN apt-get -y install cron

# setup crontab
ADD recoll.cron /etc/cron.d/recoll
RUN chmod 0744 /etc/cron.d/recoll

# get webui
RUN cd / && git clone https://framagit.org/medoc92/recollwebui.git
EXPOSE 8080

# go !
CMD [ "/root/go.sh" ]


