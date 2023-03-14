#!/bin/bash
set -e

#Param 1 - Image to scan
#Param 2 - Filename of results

docker pull arminc/clair-db:latest
docker pull arminc/clair-local-scan:latest
docker run -d --name db arminc/clair-db:latest
docker run -p 6060:6060 --link db:postgres -d --name clair --restart on-failure arminc/clair-local-scan:latest
curl -L https://github.com/arminc/clair-scanner/releases/download/v8/clair-scanner_linux_amd64 -o ./clair-scanner
chmod +x clair-scanner
myip=$(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
echo "myip=$myip"
while (! wget -q -O /dev/null http://localhost:6060/v1/namespaces); do sleep 1; done
echo "Waiting for clair daemon to start"

docker ps -a
retries=0
while (! wget -T 10 -q -O /dev/null http://localhost:6060/v1/namespaces); do
     sleep 1
     echo -n "."
     if [ $retries -eq 10 ]; then
          echo " Timeout, aborting."
          exit 1
     fi
     retries=$(($retries + 1))
done

#https://stackoverflow.com/questions/23816264/remove-all-special-characters-and-case-from-string-in-bash
./clair-scanner -r $(echo $1 | tr -dc '[:alnum:]\n\r').json --ip="$myip" --clair="http://localhost:6060" $1
echo $? #clair-scanner exit 1 if there is any unapproved vulnerability