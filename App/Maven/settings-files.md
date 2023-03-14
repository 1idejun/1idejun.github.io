[![Maven](./resource/maven.png)](https://maven.apache.org/)
## [DevOps]/[Maven]/settings-file


   
```xml

<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" 
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
   <servers>
		<server>
			<id>nexus-releases</id>
			<username>${env.bamboo_buildmaster_username}</username>
			<password>${env.bamboo_buildmaster_password}</password>
		</server>
   </servers>
   
   <profiles>
      <profile>
         <id>dejun</id>
         <repositories>
            <repository>
               <id>nexus-releases</id>
               <releases>
                  <enabled>true</enabled>
               </releases>
               <snapshots>
                  <enabled>true</enabled>
               </snapshots>
               <url>${env.bamboo_nexusrepo_url}/repository/dejun/</url>
               <layout>default</layout>
            </repository>
         </repositories>
      </profile>
   </profiles>
   
   <activeProfiles>
		<activeProfile>dejun</activeProfile>
	</activeProfiles>
  	<mirrors>
      <mirror>
         <id>central</id>
         <name>central</name>
         <url>${env.bamboo_nexusrepo_url}/repository/maven2-extended-proxy/</url>
         <mirrorOf>central</mirrorOf>
      </mirror>
    </mirrors>
</settings>


```





------
[DevOps]: <../../README.md>
[Maven]: <./Maven.md>