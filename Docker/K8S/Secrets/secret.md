[![](../resource/k8s.png)](https://kubernetes.io/docs/concepts/configuration/secret/)
## <ins>[DevOps]/[k8s]/secret


- [secret-data-base64]


In Json and Yaml,  secret data need use base64 decoded values

```sh
Encode:
echo -n <value> | base64
(-n - it guaranties that after decoding your secret key will not contain 'new line symbol’)

Decode:
echo <value> | base64 -d 
```



------

[DevOps]: <../../README.md>
[k8s]: <./k8s.md>
[secret-data-base64]: <https://kubernetes.io/docs/concepts/configuration/secret/>
