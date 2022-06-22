#!/bin/bash
function auto_login_ssh(){
    expect -c "
    set timeout 3600;
    spawn ssh -o StrictHostKeyChecking=no $2;
    expect {
        *assword:* {
            send $1\r;
        }
    }
    interact
    "
    return $?
}

#declare -a hostInfoDict

#hostInfoDict["127"]="127.0.0.1 username passwd"
#hostInfoDict["3081"]="10.161.30.81 root xxx"
    

echo $#
if [ $# -ne 1 ]; then
    echo "The args are problematic need hostIPNickName"
    exit 1
fi

sshHostIp=$1
echo $sshHostIp
# echo ${hostInfoDict[$sshHostIp]}

#OLD_IFS="$IFS"
#IFS=" "
#path_info_arr=(${hostInfoDict[$sshHostIp]})
#IFS="$OLD_IFS"

#hostIP=${path_info_arr[0]}
#hostUser=${path_info_arr[1]}
#hostPassWD=${path_info_arr[2]}

hostIP=$1
hostUser="root"
hostPassWD="youpass"

auto_login_ssh $hostPassWD $hostUser"@"$hostIP


