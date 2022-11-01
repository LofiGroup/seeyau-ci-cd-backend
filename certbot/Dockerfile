FROM certbot/certbot:v1.29.0

COPY entrypoint.sh .
COPY wait_for_it.sh .
ENTRYPOINT ["sh", "./entrypoint.sh"]