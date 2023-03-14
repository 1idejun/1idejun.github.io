[![Kubernetes](./resource/k8s.png)](https://kubernetes.io/)
## <ins>[DevOps]/[K8S]/Issues


- [imagepullbackoff](https://managedkube.com/kubernetes/k8sbot/troubleshooting/imagepullbackoff/2019/02/23/imagepullbackoff.html)

- [Kubernetes Service invalid clusterIP or resourceVersion](https://www.timcosta.io/kubernetes-service-invalid-clusterip-or-resourceversion/)


- [Readiness probe failed: ERROR curl: (7) couldn't connect to host](https://www.cnblogs.com/wannengachao/p/14228905.html)

- [failed to create LLB definition](https://blog.csdn.net/qq_41240287/article/details/125236997)

---

- [查看进程](https://blog.csdn.net/zong596568821xp/article/details/123211238)
- [Troubleshooting Kubernetes Service 503 Errors](https://komodor.com/learn/how-to-fix-kubernetes-service-503-service-unavailable-error/)
  - [nginx ingress 503 Service Temporarily Unavailable](https://www.modb.pro/db/50705)
---

- [A Pod Restarts. So, What’s Going on](https://dwdraju.medium.com/a-pod-restarts-so-whats-going-on-fa12bb8a57ea#:~:text=This%20is%20one%20of%20the,will%20be%20killed%20with%20OOM.)
- [Is It Safe to Delete Kubernetes Pods Under Load](https://betterprogramming.pub/is-it-safe-to-delete-kubernetes-pods-under-load-83c85d268024#:~:text=If%20you%20manually%20deploy%20a,unavailable%20after%20deleting%20the%20pod.)


- [networkplugin cni failed  to set up pod]
  >it is recommend to use VPC CNI 1.10.1-eksbuild.1 version for 1.21 or later EKS cluster to always keep your resources up-to-date. 

  > - Run this command to find current CNI version
  $ kubectl describe daemonset aws-node --namespace kube-system | grep Image | cut -d \"/\" -f 2

- [The BoundServiceAccountTokenVolume](https://docs.aws.amazon.com/eks/latest/userguide/service-accounts.html#service-account-tokens)

------
[DevOps]: <../../README.md>

[K8S]: <./k8s.md>