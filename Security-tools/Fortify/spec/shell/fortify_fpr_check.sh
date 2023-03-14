#!/bin/bash

set -e

usage () {
  echo "Usage: ./check_fortify_fpr.sh -f [fpr path] -q \"[query based on Fortify SSC search query syntax]\"";
  echo "Example (SCA Scan): ./check_fortify_fpr.sh -f results.fpr -q \"[fortify priority order]:critical [analysis type]:sca OR [fortify priority order]:high [analysis type]:sca OR [fortify priority order]:medium [analysis type]:sca\"";
  echo "Example (Webinspect Scan): ./check_fortify_fpr.sh -f results.fpr -q \"[fortify priority order]:critical [analysis type]:webinspect OR [fortify priority order]:high [analysis type]:webinspect OR [fortify priority order]:medium [analysis type]:webinspect\"";
  echo "exit 0 if no issue matching the query is found; 1 otherwise"
}

while getopts f:q:h option
do
  case "$option" in
    f) FPR=$OPTARG;;
    q) QUERY=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

if [ ! -f "$FPR" ] || [ -z "$QUERY" ] ; then
    echo "ERROR: Missing option" >&2
    usage
    exit 1
fi

result=$(FPRUtility -information -search -query "$QUERY" -project $FPR)
echo "result=$result"
check=$(echo "$result" | grep "No issues matched search query.")
if [ ! -z "$check" ] ; then
  echo "No issue matching query found"
  exit 0
fi

exit 1
