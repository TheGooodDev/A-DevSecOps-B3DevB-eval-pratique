FROM ubuntu:latest

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt update; \
    apt install -y gcc libffi-devel python3 epel-release; \
    apt install -y python3-pip; \
    apt install -y wget; 

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible; 