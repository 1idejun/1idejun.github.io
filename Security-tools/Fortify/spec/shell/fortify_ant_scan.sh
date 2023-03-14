#!/bin/bash

set -e

usage () {
  echo "Usage: ./fortify_ant_scan.sh -f [fpr path] -b \"[build id]\" -p \"[build.xml location]\" -e \"[Excludes]\" -z \"[OPTIONAL sourceanalyzer command line options]\"";
}

while getopts f:b:p:e:z:h option
do
  case "$option" in
    f) FPR=$OPTARG;;
    b) BUILDID=$OPTARG;;
    p) BUILDXML=$OPTARG;;
    e) EXCLUDES=$OPTARG;;
    z) OPTIONS=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

if [ -z "$FPR" ] || [ -z "$BUILDID" ] || [ -z "$BUILDXML" ]  || [ -z "$EXCLUDES" ]; then
    echo "ERROR: Missing option" >&2
    usage
    exit 1
fi

echo "Options are:"
echo "FPR="$FPR
echo "BUILDID="$BUILDID
echo "BUILDXML="$BUILDXML
echo "EXCLUDES="$EXCLUDES
echo "OPTIONAL="$OPTIONS

#clean
rm -rf *.fpr

echo "===update fortify rulepack==="
fortifyupdate

echo "===remove all SCA temp files for the build id==="
sourceanalyzer -b $BUILDID -clean

echo "===perform translation==="
sourceanalyzer -b $BUILDID ant clean compile -exclude $EXCLUDES $OPTIONS -f $BUILDXML

echo "===perform scan==="
sourceanalyzer -b $BUILDID -scan -f $FPR -64

echo "===remove all SCA temp files for the build id==="
sourceanalyzer -b $BUILDID -clean
