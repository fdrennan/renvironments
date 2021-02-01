FROM fdrennan/drenrbase
MAINTAINER Freddy Drennan

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/

RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    gdebi-core