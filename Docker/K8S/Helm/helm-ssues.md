[![](./resource/helm.png)](https://helm.sh/)
## [DevOps]/[Docker]/Helm-issues


- [UPGRADE FAILED: another operation (install/upgrade/rollback) is in progress.](https://medium.com/nerd-for-tech/kubernetes-helm-error-upgrade-failed-another-operation-install-upgrade-rollback-is-in-progress-52ea2c6fcda9)
    
    ``` helm
    helm ls --namespace <namespace>
    helm history <release> --namespace <namespace>
    helm rollback <release> <revision> --namespace <namespace>
    helm delete <release> <revision> --namespace <namespace>
    ```
----
[DevOps]: <../../README.md>
[Docker]: <../docker.md>
[Change the base image for apps using jib]: <base-image-change.md>