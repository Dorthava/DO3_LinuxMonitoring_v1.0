#!/bin/bash

source script02.sh

BACKGROUNT=(47 41 42 44 45 40)
FONT=(97 91 92 94 95 90)

bg_names=${BACKGROUNT[$1 - 1]}
bg_vals=${BACKGROUNT[$3 - 1]}
font_names=${FONT[$2 - 1]}
font_vals=${FONT[$4 - 1]}

if [ $# -ne 4 ]; then
echo "Requires 4 parameters!"
exit 1
fi 

for var in {1..4}
do
if ! [[ ${!var} =~ ^[0-6]$ ]]; then
echo "Error. Invalid parameter entered."
exit 1
fi
done

if [ $1 == $2 -o $3 == $4 ]; then
echo "Error: The font and background colors of the same column should not match."
read -p "Will you try to run the script again? (Y/n)?"
if [[ $REPLY =~ ^[Y|y]$ ]]; then 
echo "Usage: $0 <BACKGROUND_NAMES> <FONT_NAMES> <BACKGROUND_VALS> <FONT_VALS>"
exit 1
else
exit 1
fi
fi

echo -e "\033[${font_names}m\033[${bg_names}mHOSTNAME\e[0m = \033[${font_vals}m\033[${bg_vals}m$HOSTNAME\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mTIMEZONE\033[0m = \033[${font_vals}m\033[${bg_vals}m$TIMEZONE\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mUSERNAME\033[0m = \033[${font_vals}m\033[${bg_vals}m$(whoami)\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mOS\033[0m = \033[${font_vals}m\033[${bg_vals}m$OS\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mUPTIME\033[0m = \033[${font_vals}m\033[${bg_vals}m$UPTIME\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mUPTIME_SEC\033[0m = \033[${font_vals}m\033[${bg_vals}m$UPTIME_SEC\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mIP\033[0m = \033[${font_vals}m\033[${bg_vals}m$IP\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mMASK\033[0m = \033[${font_vals}m\033[${bg_vals}m$MASK\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mGATEWAY\033[0m = \033[${font_vals}m\033[${bg_vals}m$GATEWAY\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mRAM_TOTAL\033[0m = \033[${font_vals}m\033[${bg_vals}m$RAM_TOTAL\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mRAM_USED\033[0m = \033[${font_vals}m\033[${bg_vals}m$RAM_USED\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mRAM_FREE\033[0m = \033[${font_vals}m\033[${bg_vals}m$RAM_FREE\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mSPACE_ROOT\033[0m = \033[${font_vals}m\033[${bg_vals}m$SPACE_ROOT\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mSPACE_ROOT_USED\033[0m = \033[${font_vals}m\033[${bg_vals}m$SPACE_ROOT_USED\033[0m"
echo -e "\033[${font_names}m\033[${bg_names}mSPACE_ROOT_FREE\033[0m = \033[${font_vals}m\033[${bg_vals}m$SPACE_ROOT_FREE\033[0m"


exit 0
