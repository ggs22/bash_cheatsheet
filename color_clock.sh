#!/bin/bash

# Test script 
# GGS - 29/03/2020

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
log_file='test_log.txt'

if [ -f "$log_file" ]
then
    rm $log_file
fi

for method in {1..100}
do
    printf "${GREEN}"
    date_str=$(date +%H:%M:%S)
    printf "\r"
    printf "%s" "$date_str" | tee -a $log_file
    sleep 1
    printf "${RED}"
    date_str=$(date +%H:%M:%S)
    printf "\r"
    printf "%s" "$date_str" | tee -a $log_file
    sleep 1
    printf "${NC}"
    date_str=$(date +%H:%M:%S)
    printf "\r"
    printf "%s" "$date_str" | tee -a $log_file
    sleep 1
done

