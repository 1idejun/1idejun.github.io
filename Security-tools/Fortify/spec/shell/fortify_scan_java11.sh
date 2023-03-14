#!/bin/bash

set -e

usage () {
  echo "Example: ./run_fortifyjavascript_scan.sh -f results.fpr -b appid ";
}

while getopts f:b:h option
do
  case "$option" in
    f) FPR=$OPTARG;;
    b) BUILDID=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

echo "Options are:"
echo "FPR="$FPR
echo "BUILDID="$BUILDID

if [ -z "$FPR" ] || [ -z "$BUILDID" ] ; then
    echo "ERROR: Missing option" >&2
    usage
    exit 1
fi

#clean
rm -rf *.fpr

echo "===update fortify rulepack==="
fortifyupdate

echo "===remove all SCA temp files for the build id==="
sourceanalyzer -b $BUILDID -clean

echo "===perform translation==="
sourceanalyzer -b $BUILDID -exclude devops-resources -exclude ./**/test/**/*.* -source 11 $(pwd)

echo "===perform scan==="
sourceanalyzer -b $BUILDID -scan -64 -f $FPR

echo "===remove all SCA temp files for the build id==="
sourceanalyzer -b $BUILDID -clean
