#!/bin/bash
# Базовый оператор if
 commit(){
git status
git add . 
git status
echo "Please input comment for commit"
read -p 'comment: ' commitcomm
git commit -m "$commitcomm"
git push origin HEAD:main


} 
 pull(){
git pull


} 
 fetch(){
git fetch
git merge
}

 fetchhard(){
git fetch --all
git reset --hard origin/main
}  

date# Initialization step
commands=(
Commit\ and\ push
Pull
Fetch\ and\ merch
Fetch\ all\ and\ reset\ hard
)

# Choose command
choose_command(){


    clear
    while true
    do
    echo 
    echo -e "Welcome! Please select command to start:"
    echo -e "-------------------------------------------"
    for ((i=1;i<=${#commands[@]};i++ )); do
        hint="${commands[$i-1]}"
        echo -e "${green}${i}${plain}) ${hint}"
    done
    echo -e "-------------------------------------------"
    read -p "Which command you'd select(Default: ${commands[0]}):" order_num
    [ -z "$order_num" ] && order_num=1
    expr ${order_num} + 1 &>/dev/null
    if [ $? -ne 0 ]; then
        echo 
        echo -e "[${red}Error${plain}] Please enter a number"
        continue
    fi
    if [[ "$order_num" -lt 1 || "$order_num" -gt ${#commands[@]} ]]; then
        echo 
        echo -e "[${red}Error${plain}] Please enter a number between 1 and ${#commands[@]}"
        continue
    fi
    break
    done

    echo -e  "[${green}Info${plain}] You select command ${order_num}"

    case $order_num in
        1)
        commit
        ;;
        2)
        pull
        ;;
        3)
        fetch
        ;;
        4)
        fetchhard
        ;;
        *)
        exit 1
        ;;
    esac
}
# start
choose_command