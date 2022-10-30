#!/usr/bin/env sh

if [ ! -d actions-runner ]
then
  export RUNNER_ALLOW_RUNASROOT="1"
  mkdir actions-runner
  curl -o actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v2.298.2/actions-runner-linux-x64-2.298.2.tar.gz
  tar xzf ./actions-runner-linux.tar.gz -C actions-runner
  rm ./actions-runner-linux-x64-2.298.2.tar.gz

  ./actions-runner/bin/installdependencies.sh
fi