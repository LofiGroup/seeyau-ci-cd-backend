#!/usr/bin/env sh

pwd
./config.cmd --url "$GITHUB_REPO_URL" --token "$GITHUB_RUNNER_TOKEN"
./run.cmd
