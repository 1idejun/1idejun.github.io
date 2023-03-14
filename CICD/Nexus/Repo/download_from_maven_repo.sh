usage () {
  echo "Usage: ./download_from_maven_repo.sh -u [username] -p [password] -r [repository id] -g [repository group] -a [artifact id] -v [version] -f [file name] -d [destination]";
}

while getopts u:p:r:g:a:v:f:d:h option
do
  case "$option" in
    u) USER=$OPTARG;;
    p) PASSWORD=$OPTARG;;
    r) REPOSITORYID=$OPTARG;;
    g) GROUPID=$OPTARG;;
    a) ARTIFACTID=$OPTARG;;
    v) VERSION=$OPTARG;;
    f) FILE=$OPTARG;;
    d) DEST=$OPTARG;;
    h) usage; exit;;
    \?) usage; exit 1;;
    :) usage; exit 1;;
  esac
done

if [ -z "$USER" ] || [ -z "$PASSWORD" ] || [ -z "$REPOSITORYID" ] || [ -z "$GROUPID" ] || [ -z "$ARTIFACTID" ] || [ -z "$VERSION" ] || [ -z "$FILE" ] || [ -z "$DEST" ] ; then
    echo "ERROR: Missing option" >&2
    usage
    exit 1
fi

GROUPPATH=$(echo "$GROUPID" | sed 's/\./\//g')

wget -O $DEST --user=$USER --password=$PASSWORD "$bamboo_nexusrepo_url/repository/$REPOSITORYID/$GROUPPATH/$ARTIFACTID/$VERSION/$FILE"
wget -O $DEST.sha1 --user=$USER --password=$PASSWORD "$bamboo_nexusrepo_url/repository/$REPOSITORYID/$GROUPPATH/$ARTIFACTID/$VERSION/$FILE.sha1"
sha1value=$(cat $DEST.sha1)
echo "sha1sum: $sha1value  $DEST"
echo "$sha1value  $DEST" | sha1sum -c -
if [ $? -ne 0 ]; then
  exit 1
fi
