FROM ubuntu:14.04

MAINTAINER Meir Wahnon

RUN apt-get update -y

RUN apt-get install git -y --fix-missing

RUN apt-get update -qq && apt-get install -y python python-pip python-dev

RUN adduser --disabled-password --gecos '' r

RUN adduser r sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/r/

RUN  git clone https://git.openstack.org/openstack-dev/devstack

ADD local.conf devstack/

RUN ls devstack/

RUN ls devstack/tools/

ADD local.conf devstack/tools/

RUN ./devstack/tools/create-stack-user.sh

RUN chmod -R ugo+rwx devstack/

RUN chown -R r devstack/

WORKDIR  devstack/

RUN su -m r ./stack.sh
