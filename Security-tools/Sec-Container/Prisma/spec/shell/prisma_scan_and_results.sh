#!/bin/bash
set -e

#Param 1 - Image to scan
#Param 2 - Tag of image to scan
#Param 3 - Image tar
#Param 4 - Twistlock secret
#Param 5 - Output path
#Param 6 - Prisma results file
#Param 7 - Prisma findings ignore flag

IGNORE_VULNERABILITIES=${7:-false}

set +e
rm -rf $6
docker rmi -f $(docker images '$1' -q)
docker image load -i $3
docker images -q $1
set -e

color_none='\033[0m'
color_none_bold='\033[1m'
color_purple='\033[1;36m'
color_red='\033[1;31m'
color_yellow='\033[1;33m'

hatstwistcli -i $1:$2 -t $4 -o $5

printf "\nExporting the Vulnerabilities field to csv."
jq -r '.results[].vulnerabilities[]| [.severity, .packageName, .packageVersion, .link, .description, .id, .status, .cvss, .publishedDate, .discoveredDate, .fixDate, .layerTime] | @csv' $6 > ${prisma_vul_field}

printf "\nSED header into the csv."
sed -i '1s/^/"severity","packageName","packageVersion","link","description","id","status","cvss","publishedDate","discoveredDate","fixDate","layerTime"\n/' ${prisma_vul_field}

criticalCount=$(jq '.results[].vulnerabilityDistribution.critical' $6)
highCount=$(jq '.results[].vulnerabilityDistribution.high' $6)
mediumCount=$(jq '.results[].vulnerabilityDistribution.medium' $6)
lowCount=$(jq '.results[].vulnerabilityDistribution.low' $6)

totalCount=$((criticalCount + highCount + mediumCount))

printf "\n\n"
printf "PRISMA Scans\n"
printf "\t${color_red}Critical Count = $criticalCount${color_none}\n"
printf "\t${color_yellow}High Count = $highCount${color_none}\n"
printf "\t${color_purple}Medium Count = $mediumCount${color_none}\n"
printf "\n\n"

if ! $IGNORE_VULNERABILITIES && [ $totalCount -gt 0 ]; then
     printf "${color_none_bold}[ Prisma vulnerabilities Found and IGNORE flag is False, will exit with error now. ]${color_none}\n"
     exit 1
fi

#lastly we remove the colons from the filename
rename 's|:|_|g' $6