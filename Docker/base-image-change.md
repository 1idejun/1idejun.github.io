![jhipster CLI options](./resource/docker.png)
## [DevOps]/[Docker]/Change the base image for apps using jib



- [Change the base image for apps using jib]




>The base image is equivalent to the FROM instructions in a Dockerfile. The base image can be updated by changing the field from.image.

>If you would like to include a shell for debugging, set the base image to alpine:3 or openjdk:VERSION (if Java is needed).

>In order to add system packages, you will have to create a base image with those packages installed. Refer to Building containers for more information.

```xml
  <plugin>
    <groupId>com.google.cloud.tools</groupId>
    <artifactId>jib-maven-plugin</artifactId>
    <version>2.8.0</version>
    <configuration>
      <from>
        <image>gcr.io/PROJECT/BASE_IMAGE</image>
      </from>
      <to>
        <image>gcr.io/PROJECT/IMAGE_NAME</image>
      </to>
    </configuration>
  </plugin>
  ```


----
[DevOps]: <../../README.md>
[Change the base image for apps using jib]: <https:/cloud.google.com/java/getting-started/jib#base-image>

[Docker]: <../Docker/Docker.md>