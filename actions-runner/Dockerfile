FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y curl

RUN mkdir -p ~/action-runner
WORKDIR ~/action-runner

RUN curl -o actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v2.298.2/actions-runner-linux-x64-2.298.2.tar.gz
RUN tar xzf ./actions-runner-linux.tar.gz
RUN ./bin/installdependencies.sh

COPY . .

ENTRYPOINT ["sh", "./entrypoint.sh"]
