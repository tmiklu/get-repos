#!/bin/bash

USER='username'
PASS='password'
URL='curl -s -u '${USER}':'${PASS}' -X GET https://bitbucket.xxxx.com/rest/api/1.0/projects'
PROJECT=$(${URL} | jq -r .values[].key)
COLOR_START='\033[0;31m'
COLOR_END='\033[m'


while read -r line
do
        echo -e "Project: ${COLOR_START}${line}${COLOR_END}"
        ${URL}\/${line}\/repos | jq -r .values[].slug

done <<< $PROJECT
