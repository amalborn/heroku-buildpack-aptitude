FROM ubuntu:trusty

# Use closest ubuntu mirrors (prepend necessary lines to sources.list)
ADD ubuntu-mirrors /tmp/ubuntu-mirrors
RUN cat /tmp/ubuntu-mirrors > /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
  curl \
  fakeroot \
  gcc \
  git \
  make

RUN mkdir /tmp/build && mkdir /tmp/cache
ADD bin ./bin
RUN ./bin/compile /tmp/build /tmp/cache
