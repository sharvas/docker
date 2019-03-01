docker-machine stop Char
VBoxManage modifyvm Char --cpus 2
VBoxManage modifyvm Char --memory 4096
docker-machine start Char
sleep 2
eval $(docker-machine env Char)
