 #quality of life
 alias op='xdg-open'
 alias sba='source ~/.bash_aliases'
 alias shit='sudo $(history -p !!)'
 
 #python related
 alias python='python3'
 alias pip='pip3'
 
 #docker related
 alias docker='sudo docker'
 alias docker-stop-all='docker stop $(docker ps -aq)'
 alias docker-rm-all='warn docker rm $(docker ps -aq)'
 alias docker-rmi-all='warn docker rmi $(docker image list -q)'
