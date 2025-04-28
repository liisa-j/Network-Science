FROM python:latest AS build

RUN apt-get -y update
RUN apt-get install git python3 build-essential pipx jq git-lfs -y --no-install-recommends

RUN pipx ensurepath
RUN pipx install csvkit

ENV PATH="$PATH:/root/.local/bin"

WORKDIR /tmp

RUN git clone https://github.com/hsci-r/filter-data
RUN git clone https://github.com/hsci-r/filter-db

WORKDIR /tmp/filter-db

RUN DATA_DIR=../filter-data make all

FROM mariadb:latest

RUN apt-get -y update
RUN apt-get install make -y --no-install-recommends

COPY --from=build --chmod=755 /tmp/filter-db /tmp/filter-db

WORKDIR /tmp/filter-db

COPY --chmod=755 dbmeta.sh /tmp/filter-db/
COPY --chmod=755 Makefile /tmp/filter-db/
