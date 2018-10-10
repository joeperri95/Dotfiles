alias c='cd ..'
alias op='xdg-open '
alias shit='sudo $(history -p !!)'

alias spyder='spyder3'
alias lua='lua5.3'
alias python='python3'
alias pip='pip3'
alias eagle='/opt/eagle-9.2.0/eagle'

function die {
    processes=$( ps -e | grep "$1" -i | awk '{print $0}') 
    
    if [[ -z "${processes//}" ]]; then
	    echo "no processes found"
    	    return
    fi
    PIDS=$(echo "$processes" | awk '{print $1}')
    echo "$processes"
    echo "kill em? [y/n]"
    read ans
    if [ "$ans" = "y" ]; then

	    kill -9 $PIDS 
    else
	    echo "bye"
    fi
}

function go {
  echo this is under construction

}
