---
layout: default
title: Docker build and push to ECR
parent: AWS
nav_order: 3
---

[![](./resource/ecr.png)](https://aws.amazon.com/?nc2=h_lg)


```sh
# clean
docker rmi ${docker.image.name}:${version}

# build
docker build --force-rm=true -t ${docker.image.name}:${version} -f Dockerfile .
docker images

# save
docker save -o ${docker.image.name}.tar ${docker.image.name}:${version}

#stop and remove all containers
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
exit 0

#clean up
docker rmi ${docker.image.name}:${version}

#load docker image
#docker load -i ${docker.image.name}.tar
docker load -i ${docker.image.name}.tar
docker images

#Removing docker config
#rm -f $HOME/.docker/config.json
#docker logout	

#tag your image so you can push the image to this repository
docker tag ${docker.image.name}:${version} ${aws_account}.dkr.ecr.ap-southeast-1.amazonaws.com/${docker.image.name}:${version}
docker images

# Set env variables
export AWS_ACCESS_KEY_ID="abc"
export AWS_SECRET_ACCESS_KEY="abc"
#export HTTP_PROXY=${bamboo.http_proxy} 
#export HTTPS_PROXY=${bamboo.http_proxy}

#Retrieve an authentication token and authenticate your Docker client to your registry
aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin ${aws_account}.dkr.ecr.ap-southeast-1.amazonaws.com

#push this image to your newly created AWS repository
docker push ${aws_account}.dkr.ecr.ap-southeast-1.amazonaws.com/${docker.image.name}:${version}

```





