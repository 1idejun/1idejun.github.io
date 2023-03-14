[![](./resource/linux.png)](https://www.linux.org/)
## [DevOps]/[Linux]/CLI

- [linuxccool](https://www.linuxcool.com/)

```sh
set -x #echo detail logs
set -e #return failed if get error
#replace
workdir=$(echo "$hcl_path_account" | sed "s!"account.hcl"!""!")
sed -i 's!#workdir#!'$workdir'!g' CD-Stg-ref-plan-$row.yml
$hcl_path_account=$(echo "$hcl_path_account" | tr . /)

```
- [Sed](https://www.runoob.com/linux/linux-comm-sed.html)
- [Substrings](https://stackabuse.com/substrings-in-bash/)
- [echo $?](https://blog.csdn.net/qq_45837591/article/details/106453315)
- [loop and remove](https://www.jianshu.com/p/9059d08bc889)
- [operational character](https://blog.csdn.net/wudinaniya/article/details/104796403)
- [Convert String to Uppercase in Bash Shell](https://www.tutorialkart.com/bash-shell-scripting/bash-convert-string-to-uppercase/#:~:text=To%20convert%20a%20string%20to,input%20string%20to%20uppercase%20characters.)

##### netsh
```sh
netsh interface portproxy add v4tov4 listenport=1234 connectaddress=<vm ip> connectport=1234 listenaddress=<server ip> protocol=ssh
netsh interface portproxy dump
netsh interface portproxy delete v4tov4 listenport=1234 listenaddress=<server ip>

export http_proxy='http://dejun:dj123@host:8080'
export https_proxy='http:// dejun:dj123@host:8080'
```

#### LS

- [Listing only directories using ls in Bash](https://stackoverflow.com/questions/14352290/listing-only-directories-using-ls-in-bash)
---
[DevOps]: <../../README.md>
[Linux]: <./linux.md>