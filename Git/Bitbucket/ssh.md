[![Bitbucket](./resource/bitbucket.png)](https://www.atlassian.com/software/bitbucket)
## <ins>[DevOps]/[Git]/[bitbucket]/ssh


1. SSH key
https://confluence.atlassian.com/bitbucketserver/creating-ssh-keys-776639788.html

> open port 7999 in firewall

> add port forwarding 
```powershell

netsh interface portproxy add v4tov4 listenport=7999 listenaddress=<host ip> connectport=7999 connectaddress=<vm ip> 

```

2. permission grant

> global >> project >> repo


---
[DevOps]: <../../README.md>
[Git]: <../Git.md>
[bitbucket]: <./bitbucket.md>
