FROM ubuntu:14.04

MAINTAINER Meir Wahnon

RUN apt-get update -y

RUN apt-get install git -y --fix-missing

RUN adduser --disabled-password --gecos '' r

RUN adduser r sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/r/

RUN git clone https://git.openstack.org/openstack-dev/devstack

ADD local.conf devstack/

RUN chmod -R ugo+rwx devstack/

WORKDIR  devstack/

CMD su -m r ./stack.sh
