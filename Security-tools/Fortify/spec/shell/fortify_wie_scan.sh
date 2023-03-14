#!/bin/bash
set -e

usage () {
  echo "run this sh to call template to start WIE scan";

}

while getopts u:p:n:t:i:v:s:h option
do
  case "$option" in
    u) user=$OPTARG;;
    p) password=$OPTARG;;
    n) scanName=$OPTARG;;
    t) template=$OPTARG;;
    i) projectid=$OPTARG;;
    v) appver=$OPTARG;;
    s) siteId=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

if [ -z "$user" ] || [ -z "$password" ] || [ -z "$scanName" ] \
  || [ -z "$template" ] || [ -z "$projectid" ] || [ -z "$appver" ] || [ -z "$siteId" ]; then
    echo "ERROR: Missing option" >&2
    usage
    exit 1
fi

echo "1.Getting an Authentication Token"
response=$(curl --location --request POST 'https://<host>/wie/rest/api/v1/auth' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--data-raw "{
\"username\": \"${user}\",
\"password\": \"${password}\"
}"
)

echo $response
#token=$(echo $response | grep -oE '[^ ]+$' | sed -E 's/^Authorization Token: ([a-zA-Z0-9\-]+)$/\1/')
token=$(echo $response | cut -c 26-73)
echo $token
if [ ! -z "$token" ] ; then
  echo "Running the scan with Login Macro template"
fi
								   
curl --location --request POST 'https://<host>/wie/rest/api/v2/scans' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--header "Authorization: FORTIFYTOKEN ${token}" \
--data-raw "{
\"name\": \"${scanName}\",
\"projectVersion\": {\"id\": \"${projectid}\", \"name\": \"${appver}\", \"siteId\": \"${siteId}\"},
\"scanTemplateId\": \"${template}\" }"

echo "===invalidate any existing token==="
decodedToken=$(echo $token | base64 --decode)
fortifyclient -url https://<host>/ssc invalidatetoken -invalidate $decodedToken -user $user -password $password
