FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --quiet \
    && apt-get install --quiet --yes \
    libarchive-tools \
    curl \
    git
RUN ln --symbolic --force $(which bsdtar) $(which tar) && mkdir /dicecloud && chown 1000700000:root /dicecloud
WORKDIR /dicecloud
USER 1000700000
RUN curl https://install.meteor.com/?release=1.8.0.2 | sh
ENV PATH="${PATH}:/home/dicecloud/.meteor"
COPY . ./DiceCloud
ENTRYPOINT ./DiceCloud/dev.sh
