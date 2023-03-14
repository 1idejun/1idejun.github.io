#!/bin/bash

usage () {
  echo "Usage: ./fortify-vulnerability-check.sh [fpr file]";
  echo "Example: ./fortify-vulnerability-check.sh fortify-total.fpr";
}

echo "Your provided FPR file is: "$1

printf "\nAnalyzing Fortify Scan Report\n\n"
severityArr=( "Low" )
#"OWASP Top 10 2017" )
#[fortify priority order]:Critical OR [fortify priority order]:High OR [fortify priority order]:Medium AND [OWASP Top 10 2017]:A"
RED='\033[0;31m'
NC='\033[0m'
GREEN='\e[32m'
VULRESULT=""


for i in "${severityArr[@]}"
  do
    OUTPUT=$(FPRUtility -project $1 -information -search -query "[fortify priority order]:$i")
    #OUTPUTORIGINAL=$(FPRUtility -project $1 -information -search -query "[fortify priority order]:$i" -includeSuppressed)
    OUTPUTORIGINAL=$(FPRUtility -project $1 -information -search -query "[fortify priority order]:$i AND [OWASP Top 10 2017]:A")
    printf "${NC}For $i severity:\n"
    printf "${RED}Audited: ${NC}$OUTPUT\n"
    printf "${GREEN}Original: ${NC}$OUTPUTORIGINAL\n\n"

    if [[ "$OUTPUT" == *"No issues matched search query." ]]; then
      VULRESULT+="0"
    else
      VULRESULT+="1"
    fi
done

#The VULRESULT is a code to see whether there are finding(s) for the severity
#From left to right, it will be representing critical to low severity respectively
#It will then be parsed to an integer for checking in the later part of the code
#e.g. 1100 means there are at least 1 finding for both high and critical severity
printf "\n${RED}ResultCode for Fortify: ${NC}$VULRESULT\n"

VULRESULTLEN=${#VULRESULT}
if [ $VULRESULTLEN -eq 4 ]; then #The check to ensure we ran the test 4 times
  VULRESULT=$(expr $VULRESULT + 0)

  if [ $VULRESULT -ge 10 ]; then #Adjust this accordingly if you want to change the severity level to start failing the build, currently is set to medium and above
    printf "${RED}At least 1 vulnerabily(s) of medium and above in audited result, failing build now${NC}\n\n"
    exit 1

  else
    printf "${RED}No Vulnerability in audited result, proceeding with next stage${NC}\n\n"
    exit 0
  fi

else
  printf "${RED}Issue with ResultCode, please check the logic again${NC}\n\n"
  exit 1
fi
