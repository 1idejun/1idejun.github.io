#!/bin/bash

set -e;
export JAVA_HOME=${JDK_Coretto_8};

usage () {
  echo "Usage: ./run_fortify_maven3_skiptests_scan.sh -f [fpr path] -b \"[build id]\" -p \"[POM location]\" -s \"[Settings location]\" -e \"[Excludes]\" -z \"[OPTIONAL sourceanalyzer command line options]\"";
  echo "Example: ./run_fortify_maven3_skiptests_scan.sh -f [fpr path] -b \"[build id]\" -p ./checkout/pom.xml -p ./checkout/settings.xml -z \"-exclude node_modules -exclude node\"";
  echo "Example: ./run_fortify_maven3_skiptests_scan.sh -f [fpr path] -b \"[build id]\" -p ./checkout/pom.xml -p ./checkout/settings.xml -z \"-Dcom.fortify.sca.EnableDOMModeling=true\"";
}

while getopts f:b:p:s:e:z:h option
do
  case "$option" in
    f) FPR=$OPTARG;;
    b) BUILDID=$OPTARG;;
    p) POM=$OPTARG;;
    s) SETTINGS=$OPTARG;;
    e) EXCLUDES=$OPTARG;;
    z) OPTIONS=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

if [ -z "$FPR" ] || [ -z "$BUILDID" ] || [ -z "$POM" ]  || [ -z "$SETTINGS" ] || [ -z "$EXCLUDES" ]; then
    echo "ERROR: Missing option" >&2
    usage
    exit 1
fi

echo "Options are:"
echo "FPR="$FPR
echo "BUILDID="$BUILDID
echo "POM="$POM
echo "SETTINGS="$SETTINGS
echo "EXCLUDES="$EXCLUDES
echo "OPTIONAL="$OPTIONS

#clean
rm -rf *.fpr

echo "===update fortify rulepack==="
fortifyupdate

echo "===remove all SCA temp files for the build id==="
sourceanalyzer -b $BUILDID -clean

echo "===perform translation==="
sourceanalyzer -b $BUILDID mvn -settings $SETTINGS -Dfortify.sca.exclude=$EXCLUDES -Dmaven.test.skip=true -DskipTests -Dfindbugs.skip=true -f $POM

echo "===perform scan==="
sourceanalyzer -b $BUILDID -scan -mt -64 -f $FPR

echo "===remove all SCA temp files for the build id==="
sourceanalyzer -b $BUILDID -clean
