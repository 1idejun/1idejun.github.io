## [DevOps]/[Bamboo]/[Agent]/window-agent-config



1. add private nuget here 
> default path for windows is> "C:\Users\<username>\.nuget\packages"
2. install node.js
> https://nodejs.org/en/download/
Set sys env variables

> Rem to retsrat the bamboo ganet to make it can get latest PATH, u can go to next page for  the step
![](./resource/set-env.png)

3. Restart bambooagent
> stop the highlight task manually as below

![](./resource/restart-agent.png)

> run the bambooagent bat
![](./resource/run-agent.png)





[DevOps]: <../../README.md>
[Bamboo]: <../bamboo.md>
[Agent]: <../agent/agent.md>