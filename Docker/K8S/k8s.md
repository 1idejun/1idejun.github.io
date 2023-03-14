[![Kubernetes](./resource/k8s.png)](https://kubernetes.io/)
## [DevOps]/k8s


- [cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
  - [Debug Running Pods](https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/)
- [Issue](./k8s-issue.md)
- [Upgrade](https://zhuanlan.zhihu.com/p/358338665)
---

- [helm](./Helm/helm.md)

- [Service-Mesh](./Service-Mesh/mesh.md)
- [Disruption Budget](./disruption-budget.md)

- [secret-data-base64](./Secrets/secret.md)


#### CLI
```sh
kubectl rollout restart DaemonSets aws-node -n kube-system


kubectl get events -n <ns>

```

---

#### VS
[Kubernetes Vs Openshift](https://www.simplilearn.com/kubernetes-vs-openshift-article)

#### Best  pratices

- [Best practices for deploying highly available apps in Kubernetes](https://blog.flant.com/best-practices-for-deploying-highly-available-apps-in-kubernetes-part-1/)

- [Best Practices for Designing and Building Containers for Kubernetes](https://www.weave.works/blog/best-practices-for-designing-and-building-containers-for-kubernetes)

------
[DevOps]: <../../README.md>

