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

semanticCommit (){
      COMMIT_MSG="$1"   
      if [[ ${COMMIT_MSG: -1} == '.' ]];then
        let "MSG_LENGTH=${#COMMIT_MSG}-1"
        COMMIT_MSG="$(echo ${COMMIT_MSG:0: $MSG_LENGTH})"
      fi     
}

while [[ $SELECTION != 1 && $SELECTION != 2 && $SELECTION != 3 ]]
do

printf "${yellow}1. Yeni içerik yükledim\n"
printf "2. Bir şeyleri sildim\n"
printf "3. Var olan içeriği düzelttim\n${reset}"

read -p "${cyan}Değişikliğin hangi maddeyi içeriyor?:${reset}" SELECTION
    
    if [[ $SELECTION == 1 ]]; then
        COMMIT_HEADER="add:"

        elif [[ $SELECTION == 2 ]]; then
            COMMIT_HEADER="delete:"

        elif [[ $SELECTION == 3 ]]; then
            COMMIT_HEADER="fix:"

        else
            echo "Lütfen yukarıdaki sayılardan birini gir!"
            sleep 1 && clear
        fi
done

clear && read -p "${cyan}Değişikliğin ne içeriyor?:${reset}" COMMIT_MSG
semanticCommit "${COMMIT_MSG}"
COMMIT="${COMMIT_HEADER} ${COMMIT_MSG}"

clear && echo "${yellow}Başarılı!${reset}"
sleep 1 && clear

cd ..
git add .
git commit -m "$COMMIT"
git push origin master