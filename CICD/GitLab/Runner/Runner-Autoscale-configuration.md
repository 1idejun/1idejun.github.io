
[![GitLab](../resource/GitLab.png)](https://docs.gitlab.com/)
## [DevOps]/[GitLab]/Autoscale configuration



### [Autoscale configuration]
  
>- Docker has deprecated Docker Machine, the underlying technology used to autoscale runners on public cloud virtual machines.

### [Autoscaling GitLab CI on AWS Fargate]

>- The GitLab [custom executor] driver for [AWS Fargate] automatically launches a container on the Amazon Elastic Container Service (ECS) to execute each GitLab CI job.

![runner-autoscale-aws-fargate](../resource/runner-autoscale-aws-fargate.png)

>- <red>security in AWS
    - One used by the EC2 instance that hosts GitLab Runner and only accepts SSH connections from a restricted external IP range (for administrative access).
    - One that applies to the Fargate Tasks and that allows SSH traffic only from the EC2 instance.</red>

>- <red>non-public container registry
    > ECS Task will either [need IAM permissions (for AWS ECR only)] or will [require Private registry authentication for tasks] for non-ECR private registries.
    </red>

>- NOTED
    - CI/CD jobs use the image defined in the ECS task, rather than the value of the image: keyword in your .gitlab-ci.yml file. This configuration can result in multiple instances of Runner Manager or in large build containers. AWS is aware of the issue and GitLab is [tracking resolution]. You might consider creating an EKS cluster instead by following the official [AWS EKS Quick Start].
    - Fargate abstracts container hosts, which limits configurability for container host properties. This affects runner workloads that require high IO to disk or network, since these properties have limited or no configurability with Fargate. Before you use GitLab Runner on Fargate, ensure runner workloads with high or extreme compute characteristics on CPU, memory, disk IO, or network IO are suitable for Fargate.


**Dejun**
<style>
red { color: red }
yellow { color: yellow }
</style>
[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

[DevOps]: <../../README.md>
[GitLab]: <../Gitlab/GitLab.md>

[Autoscale configuration]: https://docs.gitlab.com/runner/configuration/autoscale.html
[Autoscaling GitLab CI on AWS Fargate]: https://docs.gitlab.com/runner/configuration/runner_autoscale_aws_fargate/
[custom executor]: https://docs.gitlab.com/runner/executors/custom.html
[AWS Fargate]: https://gitlab.com/gitlab-org/ci-cd/custom-executor-drivers/fargate/?_gl=1%2a1p2dgrx%2a_ga%2aMjA3NTQ2MTU5Ni4xNjU5NDEwNjMx%2a_ga_ENFH3X7M5Y%2aMTY2MzY1MjkwMi4yNi4xLjE2NjM2NTM1NjIuMC4wLjA.
[need IAM permissions (for AWS ECR only)]: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html
[require Private registry authentication for tasks]: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html
[AWS EKS Quick Start]: https://aws.amazon.com/quickstart/architecture/amazon-eks/
[tracking resolution]: https://gitlab.com/gitlab-com/alliances/aws/public-tracker/-/issues/22/?_gl=1%2axhgbph%2a_ga%2aMjA3NTQ2MTU5Ni4xNjU5NDEwNjMx%2a_ga_ENFH3X7M5Y%2aMTY2MzY1MjkwMi4yNi4xLjE2NjM2NTQxNzcuMC4wLjA.
