#!/bin/bash

set -e

usage () {
  echo "Usage: ./run_fortifyjavascript_scan.sh -f [fpr path] -b \"[build id]\" -p \"[POM location]\" -s \"[Settings location]\" -z \"[OPTIONAL sourceanalyzer command line options]\"";
  echo "Example: ./run_fortifyjavascript_scan.sh -f results.fpr -b appid -p ./checkout/pom.xml -p ./checkout/settings.xml -z \"-exclude node_modules -exclude node\"";
  echo "Example: ./run_fortifyjavascript_scan.sh -f results.fpr -b appid -p ./checkout/pom.xml -p ./checkout/settings.xml -z \"-Dcom.fortify.sca.EnableDOMModeling=true\"";
}

while getopts f:b:p:s:z:h option
do
  case "$option" in
    f) FPR=$OPTARG;;
    b) BUILDID=$OPTARG;;
    p) POM=$OPTARG;;
    s) SETTINGS=$OPTARG;;
    z) OPTIONS=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

echo "Options are:"
echo "FPR="$FPR
echo "BUILDID="$BUILDID
echo "POM="$POM
echo "SETTINGS="$SETTINGS
echo "OPTIONAL="$OPTIONS

if [ -z "$FPR" ] || [ -z "$BUILDID" ] || [ -z "$POM" ]  || [ -z "$SETTINGS" ] ; then
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
sourceanalyzer -b $BUILDID mvn -settings $SETTINGS $OPTIONS -f $POM

echo "===perform scan==="
sourceanalyzer -b $BUILDID -scan -64 -f $FPR

echo "===remove all SCA temp files for the build id==="
sourceanalyzer -b $BUILDID -clean
