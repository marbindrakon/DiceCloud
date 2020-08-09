FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --quiet \
    && apt-get install --quiet --yes \
    libarchive-tools \
    curl \
    git
RUN ln --symbolic --force $(which bsdtar) $(which tar) && mkdir /dicecloud
WORKDIR /dicecloud
RUN curl https://install.meteor.com/?release=1.8.0.2 | sh
ENV PATH="${PATH}:/dicecloud/.meteor"
COPY . ./DiceCloud
RUN chmod -R 770 /dicecloud
ENTRYPOINT ./DiceCloud/dev.sh
