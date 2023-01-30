WEB_IP=`docker exec web hostname -I`
DB_IP=`docker exec database hostname -I`

echo $WEB_IP
echo $DB_IP
docker exec -u 0 ansible bash -c "echo '[servers]
web ansible_host=$WEB_IP
db ansible_host=$DB_IP

[all:vars]
ansible_python_interpreter=/usr/bin/python3' >> /etc/ansible/hosts"

echo 'done'