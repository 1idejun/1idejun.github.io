[![Git](./resource/Git.png)](https://kubernetes.io/)
## <ins>[DevOps]/git-cli


#### [git-init]

```sh
git config --global http.sslVerify false
git config --global http.sslVerify true
```


- Configure Git for the first time
    ```git
    git config --global user.name "Dejun Li"
    git config --global user.email "dejun.li@gmail.com.sg"
    ```
- Working with your repository
  I just want to clone this repository
  If you want to simply clone this empty repository then run this command in your terminal.
    ```git
    git clone https://<repo>.git
    ```
- My code is ready to be pushed
  If you already have code ready to be pushed to this repository then run this in your terminal.
    ```git
    cd existing-project
    git init
    git add --all
    git commit -m "Initial Commit"
    git remote add origin https://<repo>.git
    git push -u origin HEAD:master
    ```
- My code is already tracked by Git
  If your code is already tracked by Git then set this repository as your "origin" to push to.
    ```git
    cd existing-project
    git remote set-url origin https://<repo>.git
    git push -u origin --all
    git push origin --tags
    ```

#### [git tag](https://git-scm.com/docs/git-tag)

```sh
git remote add central https://${bamboo.buildmaster.username}:${bamboo.buildmaster.password}@${bamboo.app.scm.path.wohttp}
git config --global user.email "${bamboo.buildmaster.email}"
git config --global user.name "${bamboo.buildmaster.username}"
git tag -a ${bamboo.version} -m 'tag ${version}'
git push central ${bamboo.version}

```

#### [create-empty-branch-on-github](https://stackoverflow.com/questions/34100048/create-empty-branch-on-github)

```sh
git switch --orphan <new branch>
git commit --allow-empty -m "Initial commit on orphan branch"
git push -u origin <new branch>
```

#### [Git Cherry Pick](https://www.atlassian.com/git/tutorials/cherry-pick)
------

[DevOps]: <../../README.md>
[git-init]: <https://git-scm.com/docs/git-init>
