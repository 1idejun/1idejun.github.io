---
layout: default
title: Git
nav_order: 8
has_children: true
permalink: /Git
---



## <ins>[DevOps]/Git

- [git-cli](git-cli.md)
- [git-best-practices](git-best-practices.md)
- [git-hook](git-hook.md)

---

1. [git clone without interactive](https://stackoverflow.com/questions/7772190/passing-ssh-options-to-git-clone)
```bash
GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone ssh://url
```

2. [switch https to ssh](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh)
------

[DevOps]: <../../README.md>