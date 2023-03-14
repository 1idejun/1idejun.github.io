---
layout: default
title: Linux
nav_order: 10
has_children: true
permalink: /Linux
---

[![](./resource/linux.png)](https://www.linux.org/)
## [DevOps]/Linux

- [CLI](./cli.md)
- [Fedora](./Fedora.md)
- [SELinux](./SELinux.md)

- [SSL format](https://blog.csdn.net/qq_22763255/article/details/105526429?utm_medium=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-1.nonecase&depth_1-utm_source=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-1.nonecase)
---

- [" vs '](https://blog.csdn.net/yangxuesong5555/article/details/79417159)
- [Curl](https://www.jianshu.com/p/102bd1c48e02)
---



### Issue

- 1. SELinux - by default is not allow HTTP comms

    > Sln: run /usr/sbin/setsebool -P httpd_can_network_connect 1 to allow it

### Best Practices

- [strace](https://blog.csdn.net/qq_25518029/article/details/119906644)

 
---
[DevOps]: <../../README.md>