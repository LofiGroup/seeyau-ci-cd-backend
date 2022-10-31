#!/usr/bin/env sh

./config.sh --url "$GITHUB_REPO_URL" --token "$GITHUB_RUNNER_TOKEN"
./run.sh

sleep infinity
