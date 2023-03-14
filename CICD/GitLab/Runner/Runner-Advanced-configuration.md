
[![GitLab](../resource/GitLab.png)](https://docs.gitlab.com/)
## [DevOps]/[GitLab]/Advanced configuration



### [Advanced configuration]
  
>- GitLab Runner does not require a restart whenyouchange most options,except for listen_address.
>- If a runner was already registered, you don’t needtoregister it again
>- config.[toml]
>- You can find the config.toml file in:
    1. /etc/gitlab-runner/ on *nix systems whenGitLabRunner is executed as root (this is also thepathfor service configuration)
    2. ~/.gitlab-runner/ on *nix systems whenGitLabRunner is         executed as non-root
    3. ./ on other systems

#### [The global section]
>- concurrent - Limits how many jobs can run concurrently, across all registered runners
>- log_level - Defines the log level. Options are debug, info, warn, error, fatal, and panic
>- [log_format] - Options are runner, text, and json
>- sentry_dsn - Enables tracking of all system level errors to Sentry

#### [The session_server section]
>- When your runner instance is already running, you might need to execute gitlab-runner restart for the changes in the [session_server] section to be take effect
>- <red> If you are using the GitLab Runner Docker image, you must expose port 8093 by adding -p 8093:8093 to your docker run command </red>
>- session_timeout - Number of seconds the session can stay active after the job completes. The timeout blocks the job from finishing. Default is 1800 (30 minutes)

#### [The runners section]
>- limit - Limit how many jobs can be handled concurrently by this registered runner. 0 (default) means do not limit.[View how this setting works with the Docker Machine executor (for autoscaling)]
>- builds_dir - Absolute path to a directory where builds are stored in the context of the selected executor. For example, locally, Docker, or SSH
>- cache_dir - Absolute path to a directory where build caches are stored in context of selected executor. For example, locally, Docker, or SSH. If the docker executor is used, this directory needs to be included in its volumes parameter
>- *_clone_script - Commands to be executed on the runner before or after clone
>- *_build_script - Commands to be executed on the runner before or after build

```toml
[[runners]]
  name = "ruby-2.7-docker"
  url = "https://CI/"
  token = "TOKEN"
  limit = 0
  executor = "docker"
  builds_dir = ""
  shell = ""
  environment = ["ENV=value", "LC_ALL=en_US.UTF-8"]
  clone_url = "http://gitlab.example.local"
```

#### [The executors]

>- docker+machine - Like docker, but use [auto-scaled Docker machines].

<style>
red { color: red }
yellow { color: yellow }
</style>
**Dejun**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

[DevOps]: <../../README.md>
[GitLab]: <../Gitlab/GitLab.md>

[Advanced configuration]: https://docs.gitlab.comrunner/configuration/advanced-configuration.html
[toml]: https://github.com/toml-lang/toml
[The global section]: https://docs.gitlab.com/runnerconfiguration/advanced-configurationhtml#the-global-section
[log_format]: https://docs.gitlab.com/runnerconfiguration/advanced-configurationhtml#log_format-examples-truncated
[The session_server section]: https://docs.gitlab.comrunner/configuration/advanced-configurationhtml#the-session_server-section
[The runners section]: https://docs.gitlab.com/runnerconfiguration/advanced-configurationhtml#the-runners-section
[View how this setting works with the Docker Machine executor (for autoscaling)]: https://docs.gitlab.com/runner/configuration/autoscale.html#limit-the-number-of-vms-created-by-the-docker-machine-executor
[The executors]: https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-executors
[auto-scaled Docker machines]: https://docs.gitlab.com/runner/configuration/autoscale.html