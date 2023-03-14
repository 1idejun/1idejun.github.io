[![](./resource/checkov.png)](https://www.checkov.io/4.Integrations/Docker.html)
## <ins>[DevOps]/CheckOV

  >Checkov is a static code analysis tool for scanning infrastructure as code (IaC) files for misconfigurations that may lead to security or compliance problems. 

  >Checkov includes more than 750 predefined policies to check for common misconfiguration issues. 

  >Checkov also supports the creation and contribution of custom policies.


### [Using Checkov with Docker]

```sh
docker pull bridgecrew/checkov
docker run --tty --volume /user/tf:/tf --workdir /tf bridgecrew/checkov --directory /tf
```

> Note: If you are using Python 3.6 (which is the default version in Ubuntu 18.04) Checkov will not work and it will fail with ModuleNotFoundError: No module named 'dataclasses'. In this case, you can use the Docker version instead.\n\nIn certain cases, when redirecting docker run --tty output to a file - for example, if you want to save the Checkov JUnit output to a file - will cause extra control characters to be printed. This can break file parsing. If you encounter this, remove the –tty flag.


---
[DevOps]: <../../README.md>

[CheckOV]: <https://www.checkov.io/
[Using Checkov with Docker]: <https://www.checkov.io/4.IntegrationDocker.html>
