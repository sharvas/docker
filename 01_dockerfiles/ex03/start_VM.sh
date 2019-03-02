docker-machine stop Char && VBoxManage modifyvm Char --cpus 2 && VBoxManage modifyvm Char --memory 4096 && docker-machine start Char && eval $(docker-machine env Char)
