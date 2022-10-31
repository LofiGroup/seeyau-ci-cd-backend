#!/usr/bin/env sh

./config.cmd --url "$GITHUB_REPO_URL" --token "$GITHUB_RUNNER_TOKEN"
./run.cmd
