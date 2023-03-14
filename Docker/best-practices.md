![jhipster CLI options](./resource/docker.png)
## [DevOps]/[Docker]/Best-practices


- [Docker 101: Fundamentals and Practice](https://www.freecodecamp.org/news/docker-101-fundamentals-and-practice-edb047b71a51)

#### Build

- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
  
- [5 Tips to Speed up Your Docker Image Build](https://vsupalov.com/5-tips-to-speed-up-docker-build/)

- [Six Ways to Build Docker Images Faster](https://devopsprodigy.com/blog/6-ways-to-build-docker-images-faster/)

- [how to go from slow to fast docker builds](https://geshan.com.np/blog/2020/10/docker-build-example-faster-docker-build/)

- [Tips for optimizing Docker builds](https://circleci.com/blog/tips-for-optimizing-docker-builds/)

---

#### In Pipeline
- [password using STDIN](https://docs.docker.com/engine/reference/commandline/login/)
    when u use 'docker login', better  use --password-stdin(standard input), this is to prevent the password from ending up in the shell’s history, or log-files.
    ```sh
    echo "$bamboo_PASSWORD" | sudo docker login -u     $bamboo_USERNAME --password-stdin $    {bamboo_nexusdockerrepo_wohttp}/$Nexusrepo
    ```
    
- [docker-logout](https://blog.runcloud.io/essential-docker-commands/)

    ```sh
    #Removing docker config(password will be stored unencrypted in /root/.docker/config.json)
    rm -f $HOME/.docker/config.json
    docker logout

    ```





----
[DevOps]: <../../README.md>
[Docker]: <../Docker/Docker.md>



