[![](../resource/jhipster.png)](https://www.jhipster.tech/)
## [DevOps]/[JHipster]/Upgrade

- [Github releases](https://github.com/jhipster/jhipster-registry/releases)

### steps - on your local

1. Install Java 11. We recommend you use AdoptOpenJDK builds, as they are open source and free.
https://adoptium.net/?variant=openjdk11
2. Install Node.js from the Node.js website (please use an LTS 64-bit version, non-LTS versions are not supported)
3. Install Git 
https://git-scm.com/downloads
4. Install JHipster: npm install -g generator-jhipster
5. See JHipster changes
   If you would like to see changes done by JHipster you can follow the steps described below.
   >5-1 Generate project with JHipster version you used last time to generate your project:

        •	create a new folder
        •	copy your project .yo-rc.json file and .jhipster folder     into this new folder
        •	find out what JHipster version you used last time to    generate your project: look at the .yo-rc.json, find out the    value of the jhipsterVersion
        •	install JHipster version you used last time to generate     your project: npm install -g    generator-jhipster@jhipsterVersionYouUsedLastTime
        •	in the created folder run: jhipster --with-entities     --skip-install

    

    >5-2 Generate project with the latest JHipster:

        •	create a new folder
        •	copy your project .yo-rc.json file and .jhipster folder     into this new folder
        •	install the latest JHipster version: npm install -g     generator-jhipster
        •	in the created folder run: jhipster --with-entities     --skip-install
6.	Upgrade application
      ```sh
      cd myapplication/
      jhipster upgrade --target-version <value>
      jhipster upgrade --target-version 7.6.0
      ```
https://www.jhipster.tech/releases/(get version here)


![jhipster CLI options](./resource/jhipster-help.png)

---
[DevOps]: <../../README.md>
[JHipster]: <../jhipster.md>