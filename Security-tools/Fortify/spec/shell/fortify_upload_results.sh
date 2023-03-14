#!/bin/bash

set -e

usage() {
  echo "Usage: ./fortify_upload_results.sh -b [build master id] -w [build master password] -f [scanned results fpr path] -r [filename for download fpr] -a \"[app id]\" -v \"[app version]\" -t \"[Fortify token]\""
}

while getopts b:w:f:r:a:v:t:h option; do
  case "$option" in
  b) BMID=$OPTARG ;;
  w) BMPWD=$OPTARG ;;
  f) FPR=$OPTARG ;;
  r) DOWNLOADFPR=$OPTARG ;;
  a) APPID=$OPTARG ;;
  v) APPVER=$OPTARG ;;
  t) TOKEN=$OPTARG ;;
  h)
    usage
    exit
    ;;
  \?)
    usage
    exit 1
    ;;
  :)
    usage
    exit 1
    ;;
  esac
done

if [ -z "$BMID" ] || [ -z "$BMPWD" ] || [ -z "$FPR" ] || [ -z "$DOWNLOADFPR" ] || [ -z "$APPID" ] || [ -z "$APPVER" ] || [ -z "$APPVER" ] || [ -z "$TOKEN" ]; then
  echo "ERROR: Missing option" >&2
  usage
  exit 1
fi

echo "Options are:"
echo "BMID="$BMID
echo "BMPWD="$BMPWD
echo "FPR="$FPR
echo "DOWNLOADFPR="$DOWNLOADFPR
echo "APPID="$APPID
echo "APPVER="$APPVER
echo "TOKEN="$TOKEN

#colors for output
RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m'

echo "Getting appversionid"
appversionlist=$(fortifyclient -url https://<host>/ssc -authtoken $TOKEN listApplicationVersions)

appversionid=$(echo $appversionlist | sed -E 's/.* ([0-9]+) '"$APPID $APPVER"'.*/\1/')
printf "${GREEN}App Version ID: $appversionid${NC}\n\n"

checknum=$(echo $appversionid | grep -E ^[0-9]+$)
if [ -z $checknum ]; then
  # echo "ERROR: appversionid is not a number: $appversionid" >&2
  printf "${RED}ERROR: appversionid is not a number: $appversionid. Exiting now.${NC}\n\n" >&2
  exit 1
fi

uploadResp=$(fortifyclient -url https://<host>/ssc -authtoken $TOKEN uploadFPR -file $FPR -applicationVersionID $appversionid)
if [[ $uploadResp =~ .*'Background submission succeeded'.* ]]; then
  printf "${GREEN}Background submission succeeded, proceeding with next FPR processing.${NC}\n\n"
else
  printf "${RED}ERROR: Background submission failed, gonna exit now.${NC}\n\n"
fi

echo "Waiting for fpr to be processed"
retries=0
encodedToken=$(echo -n $TOKEN | base64)
processed=false

until [ $retries -gt 20 ]; do
  # while ( ! "$processed") ; do
  ((retries = retries + 1))
  # if [ "$retries" -eq 20 ] ; then
  #   echo " Timeout, aborting." ;
  #   exit 1 ;
  # fi ;
  # $retries=$(("$retries"+1)) ;
  # $((++retries)) ;
  #echo $('https://<host>/ssc/api/v1/projectVersions/'$appversionid'/artifacts?start=0&limit=1 -H accept: application/json -H Authorization: FortifyToken '$encodedToken)
  # echo 3
  # echo $(curl -s -X GET "https://<host>/ssc/api/v1/projectVersions/$appversionid/artifacts?start=0&limit=1" -H "accept: application/json" -H "Authorization: FortifyToken $encodedToken")
  response=$(curl -s -X GET "https://<host>/ssc/api/v1/projectVersions/$appversionid/artifacts?start=0&limit=1" -H "accept: application/json" -H "Authorization: FortifyToken $encodedToken")
  status=$(echo $response | python -c 'import json,sys;print json.load(sys.stdin)["responseCode"]')
  if [ $status != "200" ]; then
    echo "Fail to fetch artifacts - HTTP response: $response"
    exit 1
  fi
  state=$(echo $response | python -c 'import json,sys;print json.load(sys.stdin)["data"][0]["status"]')
  if [ $state = "PROCESS_COMPLETE" ]; then
    processed=true
  else
    sleep 5
    echo -n "."
  fi
done

echo "Download fpr"
fortifyclient -url https://<host>/ssc -user $BMID -password $BMPWD downloadFPR -file $DOWNLOADFPR -project $APPID -version $APPVER
