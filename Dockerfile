FROM ubuntu:20.04

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -yy apt-utils software-properties-common gnupg2 wget
RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
RUN apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu $(lsb_release -cs) main"
RUN apt-get update -qq
RUN apt-get install -yy xvfb wine-stable
RUN apt-get install -yy --install-recommends winehq-stable lftp
ENV DISPLAY :99.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [/entrypoint.sh]
