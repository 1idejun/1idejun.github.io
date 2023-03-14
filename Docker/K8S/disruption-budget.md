[![](./resource/k8s.png)](https://kubernetes.io/)
## <ins>[DevOps]/[K8S]/[Disruption Budget] 


- [Disruption Budget]

>https://kubernetes.io/docs/concepts/workloads/pods/disruptions/

>https://kubernetes.io/docs/tasks/run-application/configure-pdb/

```yaml
apiVersion: policy/v1beta1
kind: PodDisruptionBudget
metadata:
  annotations:
  name: <app>-pdb
  namespace: <ns>
spec:
  minAvailable: #pod.min.available#
  selector:
    matchLabels:
      app: <app>
```


>Caution: Not all voluntary disruptions are constrained by Pod Disruption Budgets. For example, deleting deployments or pods bypasses Pod Disruption Budgets.


------
[DevOps]: <../../README.md>

[K8S]: <./k8s.md>