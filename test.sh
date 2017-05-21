#!/bin/bash
# Text colors
GREEN='\033[0;32m'
NC='\033[0m'

CHECK='\xE2\x9C\x94'

options=("All choices" "BBB" "CCC" "DDD")

menu() {
  echo "Avaliable installs:"
  for i in ${!options[@]}; do 
      printf "%2d. (%s ) %s\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
  done
  [[ "$msg" ]] && echo "$msg"; :
}

prompt="Choose option to check/uncheck. ENTER when done. Your choice: "
while menu && read -rp "$prompt" num && [[ "$num" ]]; do
  [[ "$num" != *[![:digit:]]* ]] &&
    (( num > 0 && num <= ${#options[@]} )) ||
    { msg="Invalid option: $num"; continue; }
    ((num--)); msg="- ${options[num]} was ${choices[num]:+un}checked"
    [[ "${choices[num]}" ]] && choices[num]="" || choices[num]=$'\033[0;32m\xE2\x9C\x94\033[0m'
  done

  printf "You selected"; msg=" nothing"
  for i in ${!options[@]}; do 
    [[ "${choices[i]}" ]] && { printf " %s" "${options[i]}"; msg=""; }
done

echo "$msg"


while $REPLY <> ^[Yy]$; do
    echo "-- $REPLY"
    echo "# Please enter your email: "
    read email
    read -p "# Are your email ($email) correct? (y/n)\n"
    echo "reply $REPLY"
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "# Generating SSH key for ${email}"
    fi
done

