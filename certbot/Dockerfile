FROM certbot/certbot:v1.29.0

RUN apt-get update
RUN apt-get install bash

COPY entrypoint.sh .
ENTRYPOINT ["sh", "./entrypoint.sh"]