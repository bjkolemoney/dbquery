#!/bin/bash
if [ -f hosts ]
then 
	PG_HOST=$(docker inspect postgres | jq -r .[].NetworkSettings.Networks.lab.IPAddress)
	echo "There is no need to do this since the \"hosts file\" is already available and the IP address of the postgres container is $PG_HOST"
else
#Create the host files #

echo "Create host files for ansible"
touch hosts

#Add the postgres nodes category
echo "[psql]" >> hosts

#Retrieve the container's host IP address
PG_HOST=$(docker inspect postgres | jq -r .[].NetworkSettings.Networks.lab.IPAddress)
echo "The IP address of the postgres container is $PG_HOST"

#Add the Host IP to the Ansible hosts file
echo 127.0.0.0.1  >> hosts

fi

