# FROM: whatever you want to use image from.
FROM ubuntu:latest

RUN mkdir /app
# COPY . /app
WORKDIR /app

# api config
# If you need auth.
ENV Authorization={Authorization}
ENV URL="https://raw.githubusercontent.com/nijuichien/Azure-WebApp-Docker-SSH-Setting/main"

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y curl
# Get Openssh prestart script.
RUN curl ${URL}/prestart.sh > /app/prestart.sh
RUN sh /app/prestart.sh "${URL}"
# RUN sh ./prestart.sh "${Authorization}" "${URL}"
