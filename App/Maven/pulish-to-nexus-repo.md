[![Maven](./resource/maven.png)](https://maven.apache.org/)
## [DevOps]/[Maven]/pulish-to-nexus-repo




1. manual push
   
```sh

--settings settings.xml  deploy:deploy-file
-DgroupId=indicator.${bamboo.app.id}.fortify 
-DartifactId=${bamboo.nexus.artifactrepository.id}
-Dversion=${bamboo.version} 
-DgeneratePom=true 
-Dpackaging=properties 
-DrepositoryId=${bamboo.maven.settings.server.id} 
-Durl=${bamboo.nexusrepo.url}/repository/${bamboo.nexus.artifactrepository.id}/ 
-Dfile=fortify-indicator.properties

```

2. using pom file
```sh

--settings settings.xml  deploy:deploy-file -DpomFile=pom.xml 
-Dversion=${bamboo.version}
-DrepositoryId=${bamboo.maven_settings_server_id} 
-Durl=${bamboo.url_nexus_repo}/repository/${bamboo.nexus_artifactrepository_id}/ 
-Dfile=${bamboo.pom_artifactId}-${bamboo.version}.jar
```



------
[DevOps]: <../../README.md>
[Maven]: <./Maven.md>