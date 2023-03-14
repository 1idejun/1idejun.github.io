#!/bin/bash

set -e

usage() {
  echo "Usage: ./fortify_generate_reports.sh -n [file name post fix] -f [filename for total results fpr] -r [filename for download fpr]"
}

while getopts n:f:r:h option; do
  case "$option" in
  n) POSTFIX=$OPTARG ;;
  f) FPR=$OPTARG ;;
  r) DOWNLOADFPR=$OPTARG ;;
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

if  [ -z "$POSTFIX" ] || [ -z "$FPR" ] || [ -z "$DOWNLOADFPR" ]; then
  echo "ERROR: Missing option" >&2
  usage
  exit 1
fi

echo "Options are:"
echo "POSTFIX="$POSTFIX
echo "FPR="$FPR
echo "DOWNLOADFPR="$DOWNLOADFPR

rm -rf reporting-*.html
rm -rf reporting-*.xls
rm -rf reporting-*.pdf
rm -rf total-*.html
rm -rf total-*.xls
rm -rf total-*.pdf

BIRTReportGenerator -template "OWASP Top 10" --UseFortifyPriorityOrder --SecurityIssueDetails --IncludeAboutFortify --IncludeDescOfKeyTerminology --Version "OWASP Top 10 2017" -source $DOWNLOADFPR -format HTML -output reporting-$POSTFIX.html

BIRTReportGenerator -template "OWASP Top 10" --UseFortifyPriorityOrder --SecurityIssueDetails --IncludeAboutFortify --IncludeDescOfKeyTerminology --Version "OWASP Top 10 2017" -source $DOWNLOADFPR -format XLS -output reporting-$POSTFIX.xls

BIRTReportGenerator -template "OWASP Top 10" --UseFortifyPriorityOrder --SecurityIssueDetails --IncludeAboutFortify --IncludeDescOfKeyTerminology --Version "OWASP Top 10 2017" -source $DOWNLOADFPR -format PDF -output reporting-$POSTFIX.pdf

BIRTReportGenerator -template "OWASP Top 10" --UseFortifyPriorityOrder --SecurityIssueDetails --IncludeAboutFortify --IncludeDescOfKeyTerminology --Version "OWASP Top 10 2017" -source $FPR -format HTML -output total-$POSTFIX.html

BIRTReportGenerator -template "OWASP Top 10" --UseFortifyPriorityOrder --SecurityIssueDetails --IncludeAboutFortify --IncludeDescOfKeyTerminology --Version "OWASP Top 10 2017" -source $FPR -format PDF -output total-$POSTFIX.pdf

BIRTReportGenerator -template "OWASP Top 10" --UseFortifyPriorityOrder --SecurityIssueDetails --IncludeAboutFortify --IncludeDescOfKeyTerminology --Version "OWASP Top 10 2017" -source $FPR -format XLS -output total-$POSTFIX.xls