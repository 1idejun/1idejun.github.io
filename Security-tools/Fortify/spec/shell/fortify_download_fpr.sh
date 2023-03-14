#!/bin/bash
set -e

usage () {
  echo "Usage: ./fortify_download_fpr -i \"[fortify app id]\" -f \"[FPR file]\"";
}

while getopts i:f:h option
do
  case "$option" in
    i) appId=$OPTARG;;
    f) fpr=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

echo "appId="$appId
echo "fpr="$fpr

#colors for output
RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m'

if [ -z "$appId" ] || [ -z "$fpr" ]; then
    echo "ERROR: Missing option" >&2
    usage
    exit 1
fi

echo "Getting appversionid"
appversionlist=$(fortifyclient -url $fortifyssc_url -authtoken $fortify_ssc_password listApplicationVersions)
echo $appversionlist

appversionid=$(echo $appversionlist | sed -E 's/.* ([0-9]+) '"$appId $fortify_ssc_appver"'.*/\1/')
printf "${GREEN}App Version ID: $appversionid${NC}\n\n"

checknum=$(echo $appversionid | grep -E ^[0-9]+$)
if [ -z $checknum ] ; then
    echo "ERROR: appversionid is not a number: $appversionid" >&2
    exit 1
fi
echo $appversionid

echo "Waiting for fpr to be processed"
retries=0
encodedToken=$(echo -n $fortify_ssc_password | base64)

processed=false
while ( ! $processed) ; do
  if [ $retries -eq 20 ] ; then
    echo " Timeout, aborting." ;
    exit 1 ;
  fi ;
  retries=$(($retries+1)) ;
  response=$(curl -s -X GET $fortifyssc_url"/api/v1/projectVersions/"$appversionid"/artifacts?start=0&limit=1" -H "accept: application/json" -H "Authorization: FortifyToken $encodedToken");
  echo $response
  status=$(echo $response | python -c 'import json,sys;print json.load(sys.stdin)["responseCode"]');
  if [ $status != "200" ]; then
    echo "Fail to fetch artifacts - HTTP response: $response";
    exit 1;
  fi;
  state=$(echo $response | python -c 'import json,sys;print json.load(sys.stdin)["data"][0]["status"]');
  if [ $state = "PROCESS_COMPLETE" ] ; then
    processed=true;
  else
    sleep 5;
    echo -n ".";
  fi;
done

echo "Download fpr"
fortifyclient -url $fortifyssc_url -user $USERNAME -password $PASSWORD downloadFPR -file $fpr -project $appId -version $fortify_ssc_appver