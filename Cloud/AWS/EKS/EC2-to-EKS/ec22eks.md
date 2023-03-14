## [DevOps]/[AWS]/[EKS]/EC2 to EKS

### Some points during app convert from ec2 to EKS



1.DB 
> In Json and Yaml, secret data(db username and password) need use base64 decoded values
> 
2.Jhipster version
> Jhipster need upgrade both Dev and Ops sides – jhipster-register

3.Configration

> Issue1 - ignoreUnknownFields
-- Issue
![](./ignoreUnknownFields.png)
-- Background
We use Jhipster to create the app framework, it will    have somedefault setting, like the ignoreUnknownFields check.
--Sln   
Make ‘ignoreUnknownFields = true’ (set application    
properties to ignore unmapped fields as they are    
configured in their respective configuration classes    
via annotations)
![](./ignoreUnknownFields-sln.png)

> Issue2 - jpa query creation exception

-- Issue
![](./issue2.png)
-- Background
Should be the Jhipster side issue
--Sln 
Make below changes
![](./issue2-sln1.png)
![](./issue2-sln2.png)
![](./issue2-sln3.png)
    
    

4.eureka enable

Remove the false to make JHipster can discovery the eureka
eureka-enable
![](./eureka-enable.png)




[DevOps]: <../../README.md>
[AWS]: <../aws.md>
[EKS]: <../eks.md>