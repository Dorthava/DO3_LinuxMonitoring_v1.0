#!/bin/bash

source script02.sh

colors=("white" "red" "green" "blue" "purple" "black")

changed=(0 0 0 0)

BACKGROUNT=(47 41 42 44 45 40)
FONT=(97 91 92 94 95 90)

bg_names=1
bg_vals=2
font_names=1
font_vals=2

# Скрипт запускается без параметров

if [ $# -ne 0 ]; then
echo "Error: The script runs without parameters."
exit 1
fi

# Проверка на вид конфигурационного файла(всё ли верно расписано)

num_lines="`wc -l config.txt | awk '{ print $1 }'`"
if [[ $num_lines -gt 4 ]] ;then
echo "more than 4 lines"
exit 1
fi

function check_err {
if ! [[ $line =~ ^[1-6]$ ]]; then
echo "Error. Invalid parameter entered."
exit 1
fi
}

line=$(grep column1_background= config.txt)

if [[ "$line" =~ ^column1_background=.$ ]]; then
line=${line: -1}
changed[0]=$line
bg_names=${BACKGROUNT[$line - 1]}
check_err
else
bg_names=${BACKGROUNT[bg_names_def - 1]}
fi

line=$(grep column2_background= config.txt)
if [[ "$line" =~ ^column2_background=.$ ]]; then
line=${line: -1}
bg_vals=${BACKGROUNT[$line - 1]}
changed[2]=$line
check_err
else
bg_vals=${BACKGROUNT[bg_vals_def - 1]}
fi

line=$(grep column1_font_color= config.txt)
if [[ "$line" =~ ^column1_font_color=.$ ]]; then
line=${line: -1}
changed[1]=$line
check_err
font_names=${FONT[$line - 1]}
else
font_names=${FONT[font_names_def - 1]}
fi

line=$(grep column2_font_color= config.txt)
if [[ "$line" =~ ^column2_font_color=.$ ]]; then
line=${line: -1}
changed[3]=$line
check_err
font_vals=${FONT[$line - 1]}
else
font_vals=${FONT[font_vals_def - 1]}
fi

if [ ${changed[0]} = ${changed[1]} ] || [ ${changed[2]} = ${changed[3]} ]; then
echo "Error. Invalid parameter entered."
exit 1
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

echo -e "\n"

if [ ${changed[0]} -ne 0 ]; then
i=${changed[0]}
echo -e "Column 1 background = $i (${colors[$i-1]})"
else
echo -e "Column 1 background = default (${colors[$bg_names_def-1]})"
fi

if [ ${changed[1]} -ne 0 ]; then
i=${changed[1]}
echo -e "Column 1 font color = $i (${colors[$i-1]})"
else
echo -e "Column 1 font color = default (${colors[$font_names_def-1]})"
fi

if [ ${changed[2]} -ne 0 ]; then
i=${changed[2]}
echo -e "Column 2 background = $i (${colors[$i-1]})"
else
echo -e "Column 2 background = default (${colors[$bg_vals_def-1]})"
fi

if [ ${changed[3]} -ne 0 ]; then
i=${changed[3]}
echo -e "Column 2 font color = $i (${colors[$i-1]})"
else
echo -e "Column 2 font color = default (${colors[$font_vals_def-1]})"
fi

exit 0