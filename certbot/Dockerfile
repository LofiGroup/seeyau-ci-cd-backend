FROM certbot/certbot:v1.29.0

RUN apt update
RUN apt install bash

COPY entrypoint.sh .
ENTRYPOINT ["sh", "./entrypoint.sh"]