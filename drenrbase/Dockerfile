FROM ubuntu:focal
MAINTAINER Freddy Drennan

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/

RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    gnupg \
    ca-certificates \
    git \ 
    libcurl4-openssl-dev \ 
    libssl-dev \ 
    libxml2-dev \
    libgit2-dev

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" >> /etc/apt/sources.list

RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    r-base \
    r-base-dev 

RUN R -e "install.packages(c('tidyverse', 'devtools', 'reticulate'))"

RUN R -e "reticulate::install_miniconda(force=TRUE)"