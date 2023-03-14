#!/bin/bash

#https://www.microfocus.com/documentation/fortify-software-security-center/2010/SSC_Help_20.1.0/Content/SSC_UG/Gen_Auth_Tokens.htm

set -e

usage () {
 
  echo "AnalysisDownloadToken	 - Download merged result files";
  echo "AnalysisUploadToken - Upload scan results to Fortify Software Security Center and list applications";
  echo "AuditToken - Load details about current security issues and apply analysis tags";
  echo "CIToken	 - Enables integration of Software Security Center with continuous integration plugins";
  echo "CloudCtrlToken	 - Obsolete - replaced with ScanCentralCtrlToken";
  echo "CloudOneTimeJobToken	 - Obsolete - replaced with ScanCentralOneTimeJobToken";
  echo "DownloadFileTransferToken	 - Typically created programmatically by automation scripts using the /fileTokens endpoint to support a file download within an authenticated sessionClosed";
  echo "PurgeProjectVersionToken	 - Provides the capability to programmatically request a list of all applicationClosed versions, and to purge application versions from Fortify Software Security Center";
  echo "ReportFileTransferToken	 - Typically created programmatically by automation scripts using the /fileTokens endpoint to support downloading an existing report within an authenticated session";
  echo "ReportToken - Enables users to Request list of saved reports/Request list of saved reports/Delete saved reports/Return list of saved reports associated with a specific application versionClosed/Generate new reports";
  echo "ScanCentralCtrlToken	- For ScanCentral communications using the Fortify ScanCentralClosed CLI tools";
  echo "ScanCentralOneTimeJobToken	- Single-use token specification typically created programmatically by the ScanCentral clientClosed";
  echo "UnifiedLoginToken -	Enables access to most of the REST API. It is intended for short-run automations that last less than a day";
  echo "UploadFileTransferToken -	Typically created programmatically by automation scripts using the /fileTokens endpoint to support a file upload within an authenticated session";
  echo "VSTSExtensionToken -	Multi-use token specification used by the Fortify Azure DevOps extension to upload FPR(s) to Fortify Software Security Center and, optionally, submit a scan to Fortify ScanCentral.";
  echo "WIESystemToken -	Internal token specification created programmatically by Fortify WebInspect EnterpriseClosed. (Not for individual use.)";
  echo "WIEUserToken	- Internal token specification created programmatically by Fortify WebInspect Enterprise. (Not for individual use.)";

}

while getopts u:p:k:h option
do
  case "$option" in
    u) user=$OPTARG;;
    p) password=$OPTARG;;
    k) token_type=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

if [ -z "$user" ] || [ -z "$password" ] || [ -z "$token_type" ] ; then
    echo "ERROR: Missing option" >&2
    usage
    exit 1
fi

response=$(fortifyclient -url https://<host>/ssc -user $user -password $password token -gettoken "$token_type")
token=$(echo $response | grep -oE '[^ ]+$' | sed -E 's/^Authorization Token: ([a-zA-Z0-9\-]+)$/\1/')
#echo "token=$token"
if [ ! -z "$token" ] ; then
  echo $token
  exit 0
fi

exit 1
