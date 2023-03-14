[![](./resource/fedora.png)](https://getfedora.org/)
## [DevOps]/[Linux]/Fedora

- [Recommended Partitioning Scheme](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s2-diskpartrecommend-x86)

- [Port_Forwarding](https://docs.fedoraproject.org/en-US/Fedora/19/html/Security_Guide/sec-Configure_Port_Forwarding-CLI.html)
- [fedora-install-java](https://phoenixnap.com/kb/fedora-install-java)

- Issue
  - hung when dnf install
    ```bash
    dnf clean all
    dnf check
    dnf check-update
    dnf update
    ```

---
1.	How to setup NAT.
https://social.technet.microsoft.com/Forums/azure/en-US/2731dfe3-f1bc-4d2a-8437-23b2d426b7b0/how-to-route-from-public-ip-to-web-server-in-hyperv-vm-which-uses-rras-for-nat?forum=winserverPN

2.	How to configure Port forwarding
http://woshub.com/port-forwarding-in-windows/

3.	More netsh details
https://docs.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-interface-portproxy

4.	Pinging from behind a proxy
https://superuser.com/questions/175428/how-to-ping-when-behind-a-proxy

5.	Set Proxy in Fedora
https://www.thegeekdiary.com/how-to-configure-proxy-server-in-centos-rhel-fedora/

6.	Set DNS in Fedora
https://unix.stackexchange.com/questions/90035/how-to-set-dns-resolver-in-fedora-using-network-manager <Method 1

7.	Set Proxy in DNF inside Fedora
https://tylersguides.com/guides/using-a-proxy-with-dnf/

8.	Set no_proxy in Fedora
https://askubuntu.com/questions/11274/setting-up-proxy-to-ignore-all-local-addresses

9.	Transferring Hyper V Guest / Integration Files to Fedora
https://www.altaro.com/hyper-v/transfer-files-linux-hyper-v-guest/



---
[DevOps]: <../../README.md>
[linux]: <./linux.md>