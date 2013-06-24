# re-number tmux sessions
for session in $(tmux ls | awk -F: '{print $1}') ;do
    echo $session
    inum=0
    for window in $(tmux lsw -t $session | awk -F: '/^[0-9*]/ {print $1}') ;do
        if [ ${window} -gt ${inum} ] ;then
            echo "${session}:${window} -> ${session}:${inum}"
            tmux movew -d -s ${session}:${window} -t ${session}:${inum}
        fi
        inum=$((${inum}+1))
    done
done
