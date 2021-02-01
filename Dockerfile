FROM ubuntu:focal
MAINTAINER Freddy Drennan

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/

RUN apt-get update &&\
 apt-get install -y software-properties-common &&\
 add-apt-repository universe
 
RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    gnupg \
    ca-certificates \
    git \ 
    libcurl4-openssl-dev \ 
    libssl-dev \ 
    libxml2-dev \
    libgit2-dev \
    gdebi-core \
    wget

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" >> /etc/apt/sources.list

RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    r-base \
    r-base-dev 

RUN R -e "install.packages(c('tidyverse', 'devtools', 'reticulate'))"
RUN R -e "install.packages('shiny', repos='https://cran.rstudio.com/')"
RUN R -e "reticulate::install_miniconda(force=TRUE)"

RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1103-amd64.deb
RUN gdebi rstudio-server-1.4.1103-amd64.deb | yes

RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.16.958-amd64.deb
RUN gdebi shiny-server-1.5.16.958-amd64.deb | yes