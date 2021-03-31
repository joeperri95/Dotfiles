#quality of life
alias op='xdg-open'
alias sba='source ~/.bash_aliases'
alias eba='vim ~/.bash_aliases'
alias sbr='vim ~/.bashrc'
alias ebr='vim ~/.bashrc'
alias shit='sudo $(history -p !!)'
alias bt='bluetoothctl'


function yoink(){
    # give me ownership
    sudo chown $USER $1
    sudo chgrp $USER $1
}

#ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#default alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#git related
alias gs='git status'
alias gp='git push'

#docker related
alias dc='docker-compose'
alias docker='sudo docker'
alias docker-stop-all='docker stop $(docker ps -aq)'
alias docker-rm-all='docker rm $(docker ps -aq)'
alias docker-rmi-all='docker rmi $(docker image list -q)'