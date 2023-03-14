---
layout: default
title: Sec
nav_order: 11
has_children: true
permalink: /Sec
---

## [DevOps]/Scan





---
- [Pre-commit](./Pre-commit/Pre-commit.md)


---

- [Container-scanning tools VS](https://kubedex.com/container-scanning/)
- [7 Kubernetes Security Scanners](https://thechief.io/c/editorial/7-kubernetes-security-scanners-to-use-in-your-devsecops-pipeline/)





[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

#### scan validation

```sh
result=$(cat output.xml | grep -w " problem")

if [[ -z $result ]] ; then
    echo "all robot case passed" 
	else
	echo "TFSec has failed case, please check the TFSec scan log"
	exit 1
fi
```


---
[DevOps]: <../../README.md>