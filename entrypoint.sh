#!/usr/bin/env sh
set -e
set +e
  kontena service rm --force repro-redis
set -e

kontena service create --instances 1 repro-redis redis
kontena service start repro-redis

while true; do
  set +e
    containers=$(kontena service containers repro-redis)
  set -e
  [ "$containers" != "" ] && break
  echo  "waiting for containers to start..."
done
echo "containers started"

set +e
  kontena service exec repro-redis uptime
  exec_exit_code=$?
set -e

[ "$exec_exit_code" != 0 ] && cat /root/.kontena/kontena.log
