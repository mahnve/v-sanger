#!/usr/bin/env bash

cd $(pwd)

CHANGED=$(git status --porcelain)
if [[ ${CHANGED} != ''  ]]
then
    echo "Commit changes before publishing"
    exit 1
else
    echo "Really publish?"
    read REALLY
    if [[ ${REALLY} == "yes" ]]
    then
        rsync -avz --delete --groupmap=*:www-data --chmod=D0775,F0664 public/ 178.62.186.32:/var/www/www.v-sanger.se/public_html/
    else
        echo "Never mind then"
    fi
fi
