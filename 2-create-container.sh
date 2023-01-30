#!/bin/bash
docker compose up -d
docker exec web apt update 
docker exec web apt install openssh-server -y
docker exec web useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo  -u 1000 test 
docker exec web echo 'test:test' | chpasswd
docker exec web service ssh start

docker exec ansible apt install -y software-properties-common
docker exec ansible apt-add-repository ppa:ansible/ansible
docker exec ansible apt update
docker exec ansible apt install -y ansible
docker exec ansible apt install nano
docker exec ansible apt install sudo
docker exec ansible nano /etc/ansible/hosts
docker exec ansible apt update 
docker exec ansible apt install openssh-server -y
docker exec ansible useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo  -u 1000 test 
docker exec ansible echo 'test:test' | chpasswd
docker exec ansible service ssh start¨

WEB_IP=docker exec web hostname -I
DB_IP=docker exec database hostname -I
docker exec -u 0 ansible bash -c "echo '[servers]
web ansible_host=$WEB_IP

[all:vars]
ansible_python_interpreter=/usr/bin/python3' >> /etc/ansible/hosts"

echo 'done'