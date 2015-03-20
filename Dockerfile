FROM ubuntu:14.04

MAINTAINER Meir Wahnon

RUN apt-get update -y

RUN apt-get install git -y --fix-missing

RUN adduser --disabled-password --gecos '' r

RUN adduser r sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/r/

RUN git clone https://git.openstack.org/openstack-dev/devstack

RUN chmod -R 666 devstack/

ADD local.conf devstack/

WORKDIR  devstack/

RUN su -m r ./stack.sh
