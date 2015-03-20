FROM ubuntu:14.04

MAINTAINER Meir Wahnon

RUN apt-get update -y

RUN apt-get install git -y --fix-missing

RUN git clone https://git.openstack.org/openstack-dev/devstack

WORKDIR  /devstack/

RUN ./stack.sh