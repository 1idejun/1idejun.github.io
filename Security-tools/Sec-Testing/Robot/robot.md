[![Bitbucket](../resource/robot.png)](https://robotframework.org/)
## <ins>[DevOps]/Robot

- [Official Guide](https://www.jianshu.com/p/c3a9d20db4e5)
- [User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#general-usage-1)
- [run-headless-remote-chrome](https://stackoverflow.com/questions/46812155/how-to-run-headless-remote-chrome-using-robot-framework/59857241#59857241
)


#### Issue
- (unknown error: DevToolsActivePort file doesn't exist)
  (The process started from chrome location /* is no longer running, so ChromeDriver is assuming that Chrome has crashed.)

    - Sln – add below in the robot test file

    ```xml
    *** Keywords ***
    Open Browser
        ${chrome_options}    Evaluate    sys.modules['selenium. webdriver'].ChromeOptions()    sys, selenium.webdriver
        Call Method    ${chrome_options}    add_argument        --disable-extensions
        Call Method    ${chrome_options}    add_argument        --headless
        Call Method    ${chrome_options}    add_argument        --disable-gpu
        Call Method    ${chrome_options}    add_argument        --no-sandbox
        Call Method    ${chrome_options}    add_argument    $   {WINSIZE}
        Create Webdriver    ${BROWSER}      chrome_options=$    {chrome_options}
        Go To   ${urlUAT}
        Maximize Browser Window
    ```

---
[DevOps]: <../../README.md>
[Scan]: <../scan.md>
