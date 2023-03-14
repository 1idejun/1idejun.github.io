[![Maven](./resource/maven.png)](https://maven.apache.org/)
## [DevOps]/[Maven]/issues


- [Error code](https://blog.csdn.net/yjclsx/article/details/88231540)

- Blocked mirror for repositories

    > Root cause – new maven 3.8 will block repo of ‘http’.
    > Sln – use old version or upgrade existing repo/mirro

- NullPointerException
    ![](resource/NullPointerException.png)
    > Root cause – most of the case is due to using   higherjdk version
    > Sln – confirm the java version in pom and correct/  downgrade it
- Illegal-processing-instruction
    ![](resource/Illegal-processing-instruction.png)
    > Location - at [row,col {unknown-source}]: [2,5]
    > Root cause
    ![](resource/Illegal-processing-instruction1.png)

    > < ?xml version="1.0" encoding="UTF-8"?> This line must appear on the first line and must be prepended without any Spaces or other characters  
  


------
[DevOps]: <../../README.md>
[Maven]: <./Maven.md>