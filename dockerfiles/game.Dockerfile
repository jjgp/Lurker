FROM ubuntu:16.04

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
    net-tools \
    htop  \
    python-minimal \
    software-properties-common \
    unzip \
    wget

ARG GAME_VERSION=4.6.2
ARG BUILD_NUMBER=69232
ENV BUILD_NUMBER=${BUILD_NUMBER}
RUN wget http://blzdistsc2-a.akamaihd.net/Linux/SC2.${GAME_VERSION}.${BUILD_NUMBER}.zip -O SC2.zip && \
    unzip -P iagreetotheeula SC2.zip -d ~/ && \
    wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season1.zip && \
    unzip -P iagreetotheeula Ladder2017Season1.zip -d ~/StarCraftII/Maps && \
    wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season2.zip && \
    unzip -P iagreetotheeula Ladder2017Season2.zip -d ~/StarCraftII/Maps && \
    wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season3_Updated.zip && \
    unzip -P iagreetotheeula Ladder2017Season3_Updated.zip -d ~/StarCraftII/Maps && \
    wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season4.zip && \
    unzip -P iagreetotheeula Ladder2017Season4.zip -d ~/StarCraftII/Maps && \
    wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2018Season1.zip && \
    unzip -P iagreetotheeula Ladder2018Season1.zip -d ~/StarCraftII/MapPacks && \
    wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2018Season2_Updated.zip && \
    unzip -P iagreetotheeula Ladder2018Season2_Updated.zip -d ~/StarCraftII/Maps && \
    wget http://blzdistsc2-a.akamaihd.net/MapPacks/Melee.zip && \
    unzip -P iagreetotheeula Melee.zip -d ~/StarCraftII/Maps && \
    rm *.zip