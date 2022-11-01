#!/bin/bash

chmod +x /utility/wait_for_it.sh
sh /utility/wait_for_it.sh "${JENKINS_ADDRESS}" -t "${WAIT_FOR_IT_TIME}" -- echo "Jenkins is ready"

# If no certificates are obtained, create dummy ones to start the nginx
if [ ! -f "${KEYS_FOLDER}/privkey.pem" ]
then mkdir -p "${KEYS_FOLDER}" &&
echo "SSL certificates are not present creating dummy ones" &&
openssl req -batch -newkey rsa:2048 -new -nodes -x509 -days 2 -keyout "${KEYS_FOLDER}"/privkey.pem -out "${KEYS_FOLDER}"/fullchain.pem
fi

./watch-for-certificate-updates.sh &
sleep 2

# Running entrypoint script from base image
./docker-entrypoint.sh nginx -g "daemon off;"
