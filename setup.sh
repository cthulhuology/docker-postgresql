#!/bin/bash 

sudo docker run -i -t postgresql /bin/bash /setup.sh
CONTAINER=$(sudo docker ps -a | grep postgresql | awk '{ print $1 }')
IMAGE=$(sudo docker commit $CONTAINER postgresql)
sudo docker tag $IMAGE postgresql
