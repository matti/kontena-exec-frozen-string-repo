# repro

1.3.0.rc1 fails:
```
$ KONTENA_GEM_VERSION=--pre KONTENA_URL=https://xxxx.kontena.cloud KONTENA_TOKEN=abbacdabbacd KONTENA_GRID=dolan docker-compose up --build --force-recreate
Building app
Step 1/6 : FROM ruby:2.4.1-alpine
 ---> 3db0e32b7207
Step 2/6 : ARG KONTENA_GEM_VERSION
 ---> Using cache
 ---> 57af58d57084
Step 3/6 : WORKDIR /app
 ---> Using cache
 ---> 91a378d96411
Step 4/6 : RUN gem install kontena-cli $KONTENA_GEM_VERSION
 ---> Using cache
 ---> 505885c7da61
Step 5/6 : COPY entrypoint.sh .
 ---> Using cache
 ---> 71cb3298eba7
Step 6/6 : ENTRYPOINT /app/entrypoint.sh
 ---> Using cache
 ---> 206cdea4dd5b
Successfully built 206cdea4dd5b
Recreating kontenaexecfrozenstringrepo_app_1
Attaching to kontenaexecfrozenstringrepo_app_1
app_1  | * Removing service repro-redis ..
app_1  | * Removing service repro-redis .. done
app_1  | * Creating repro-redis service ..
app_1  | * Creating repro-redis service .. done
app_1  | * Sending start signal to repro-redis service ..
app_1  | * Sending start signal to repro-redis service .. done
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | waiting for containers to start...
app_1  | containers started
app_1  |  [error] RuntimeError : can't modify frozen String
app_1  |          See /root/.kontena/kontena.log or run the command again with environment DEBUG=true set to see the full exception
app_1  | # Logfile created on 2017-06-04 09:52:20 +0000 by logger.rb/56815
app_1  | E, [2017-06-04T09:52:48.333340 #59] ERROR -- CLI: can't modify frozen String (RuntimeError)
app_1  | /usr/local/bundle/gems/kontena-cli-1.3.0.rc2/lib/kontena/cli/helpers/exec_helper.rb:48:in `ws_url'
app_1  | /usr/local/bundle/gems/kontena-cli-1.3.0.rc2/lib/kontena/cli/services/exec_command.rb:92:in `normal_exec'
app_1  | /usr/local/bundle/gems/kontena-cli-1.3.0.rc2/lib/kontena/cli/services/exec_command.rb:77:in `exec_container'
app_1  | /usr/local/bundle/gems/kontena-cli-1.3.0.rc2/lib/kontena/cli/services/exec_command.rb:61:in `execute'
app_1  | /usr/local/bundle/gems/kontena-cli-1.3.0.rc2/lib/kontena/command.rb:201:in `run'
app_1  | /usr/local/bundle/gems/clamp-1.1.2/lib/clamp/subcommand/execution.rb:11:in `execute'
app_1  | /usr/local/bundle/gems/kontena-cli-1.3.0.rc2/lib/kontena/command.rb:201:in `run'
app_1  | /usr/local/bundle/gems/clamp-1.1.2/lib/clamp/subcommand/execution.rb:11:in `execute'
app_1  | /usr/local/bundle/gems/kontena-cli-1.3.0.rc2/lib/kontena/command.rb:201:in `run'
app_1  | /usr/local/bundle/gems/clamp-1.1.2/lib/clamp/command.rb:132:in `run'
app_1  | /usr/local/bundle/gems/kontena-cli-1.3.0.rc2/bin/kontena:18:in `<top (required)>'
app_1  | /usr/local/bundle/bin/kontena:23:in `load'
app_1  | /usr/local/bundle/bin/kontena:23:in `<main>'
kontenaexecfrozenstringrepo_app_1 exited with code 0
```

# 1.2.2 works

```
$ KONTENA_GEM_VERSION= KONTENA_URL=https://xxxx.kontena.cloud KONTENA_TOKEN=abbacdabbacd KONTENA_GRID=dolan docker-compose up --build --force-recreate
Building app
Step 1/6 : FROM ruby:2.4.1-alpine
 ---> 3db0e32b7207
Step 2/6 : ARG KONTENA_GEM_VERSION
 ---> Using cache
 ---> 57af58d57084
Step 3/6 : WORKDIR /app
 ---> Using cache
 ---> 91a378d96411
Step 4/6 : RUN gem install kontena-cli $KONTENA_GEM_VERSION
 ---> Running in 2a3b4548a83c
Successfully installed excon-0.49.0
Successfully installed necromancer-0.4.0
Successfully installed equatable-0.5.0
Successfully installed tty-color-0.4.2
Successfully installed pastel-0.7.1
Successfully installed tty-cursor-0.4.0
Successfully installed wisper-1.6.1
Successfully installed tty-prompt-0.12.0
Successfully installed clamp-1.1.2
Successfully installed ruby_dig-0.0.2
Successfully installed public_suffix-2.0.5
Successfully installed addressable-2.5.1
Successfully installed launchy-2.4.3
Successfully installed hash_validator-0.7.1
Successfully installed retriable-2.1.0
Successfully installed opto-1.8.5
Successfully installed semantic-1.6.0
Successfully installed safe_yaml-1.0.4
Successfully installed liquid-4.0.0
Successfully installed tty-screen-0.5.0
Successfully installed unicode_utils-1.4.0
Successfully installed unicode-display_width-1.1.3
Successfully installed verse-0.5.0
Successfully installed tty-table-0.8.0
Successfully installed kontena-cli-1.2.2
25 gems installed
 ---> 78361bd2b437
Removing intermediate container 2a3b4548a83c
Step 5/6 : COPY entrypoint.sh .
 ---> ed2088fc101c
Removing intermediate container 5bdd3b64ee8a
Step 6/6 : ENTRYPOINT /app/entrypoint.sh
 ---> Running in 0bdcdc3eb69e
 ---> 3dc7ba682603
Removing intermediate container 0bdcdc3eb69e
Successfully built 3dc7ba682603
Recreating kontenaexecfrozenstringrepo_app_1
Attaching to kontenaexecfrozenstringrepo_app_1
app_1  | * Removing service repro-redis ..
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | * Removing service repro-redis .. done
app_1  | * Creating repro-redis service ..
app_1  | * Creating repro-redis service .. done
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | * Sending start signal to repro-redis service ..
app_1  | * Sending start signal to repro-redis service .. done
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | waiting for containers to start...
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
app_1  | containers started
app_1  |  10:05:20 up 1 day,  1:08,  0 users,  load average: 0.08, 0.08, 0.16
app_1  | Warning: Server version is 1.3.0.rc1. You are using CLI version 1.2.2.
kontenaexecfrozenstringrepo_app_1 exited with code 1
```
