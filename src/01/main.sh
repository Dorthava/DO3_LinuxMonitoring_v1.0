#!/bin/bash
chmod +x main.sh

if [ -z "$1" ]; then
echo "Не было введено ни одного параметра"
elif [ -n "$2" ]; then
echo "Введено больше одного параметра"
elif [[ "$1" =~ [0-9] ]]; 
then
echo "incorrect input"
else
echo "$1"
fi

