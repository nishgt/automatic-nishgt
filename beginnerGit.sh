#!/bin/bash
yellow=`tput setaf 3`
blue=`tput setaf 4`
red=`tput setaf 1`
cyan=`tput setaf 6`
magenta=`tput setaf 5`
reset=`tput sgr0`

drawLine (){
    for (( i=1; i<=40; i++ ))
    do  
        printf "-"
    done
}

cd .git_engine/

while [[ $BRANCHING != 1 && $BRANCHING != 2 && $BRANCHING != 3 ]]
do

printf "${cyan}1. Klasörü Güncelle\n2. Değişiklikleri Gönder\n${red}3. Kayıtları Görüntüle${reset}\n$(drawLine)\n${reset}"
read -p "${cyan}Ne yapmak istiyorsun?:${reset}" BRANCHING
    
    if [[ $BRANCHING == 1 ]]; then
        clear && bash sync.sh

        elif [[ $BRANCHING == 2 ]]; then
            clear && bash push.sh

        elif [[ $BRANCHING == 3 ]]; then
            clear && git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
  
        else
            echo "Lütfen bir işlem seçin!"
            sleep 1 && clear
    fi
done