## <ins>[DevOps]/[Git]/[Migration]/SVN2Bitbucket


```git
#migrate repo from svn to bitbcuket
#login remote server with svn-migration-scripts.jar

#1.sudo to root and remove
rm -rf /home/ec2-user/GitMigration/*
#2.cd 
cd /home/ec2-user/GitMigration

#3.create new repo in bitbucket

#4.replace the svn repo link and run the jar to export the commit
java -jar /home/ec2-user/svn-migration-scripts.jar authors <svn repo> <id> <pw> >> authors.txt
cp authors.txt authors.txt.bak
vi authors.txt

%s/@mycompany.com>/@dejun>/g

#5.checkout code from svn
clear ; date ; git svn clone --authors-file=authors.txt <svn repo> --username <id>  ; date
 
#6.cd 
cd <folder of the SVN repo>

#7.replace the bitbucket repo link, change the branch and run the jar to push 
java -Dfile.encoding=utf-8 -jar /home/ec2-user/svn-migration-scripts.jar clean-git --force
 
git rev-list --objects --all | sort -k 2 > allfileshas.txt;git gc && git verify-pack -v .git/objects/pack/pack-*.idx | egrep "^\w+ blob\W+[0-9]+ [0-9]+ [0-9]+$" | sort -k 3 -n -r > bigobjects.txt
for SHA in `cut -f 1 -d\  < bigobjects.txt`; do echo $(grep $SHA bigobjects.txt) $(grep $SHA allfileshas.txt) | awk '{print$1,$3,$7}' >> bigtosmall.txt; done
 
git filter-branch -f --prune-empty --index-filter 'git rm -rf --cached --ignore-unmatch MY-BIG-DIRECTORY-OR-FILE' --tag-name-filter cat -- --all
 
rm -f allfileshas.txt bigobjects.txt bigtosmall.txt
 
git config --global user.name "dejun"
git config --global user.email "dejun@gmail"
git init
git add --all
git commit -m "Initial commit"
git remote add origin https://bitbucket/scm/dejun.git
 
git push -u origin HEAD:master


```

#### Issues

- [refuse to pull unrelated histories](https://www.educative.io/edpresso/the-fatal-refusing-to-merge-unrelated-histories-git-error)

> Root cause – these 2 repo are individual

> Sln:
```bash
git pull origin master – allow-unrelated-histories
```




---
[DevOps]: <../../README.md>
[Git]: <../Git.md>
[Migration]: <./Migration.md>