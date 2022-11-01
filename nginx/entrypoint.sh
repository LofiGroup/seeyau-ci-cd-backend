#!/usr/bin/env sh

chmod +x /utility/wait_for_it.sh
sh -c "/utility/wait_for_it.sh -t \"${WAIT_FOR_IT_TIME}\" \"${JENKINS_ADDRESS}\" -- echo \"Jenkins is ready\"" &&

# If no certificates are obtained, create dummy ones to start the nginx
if [ ! -f "${KEYS_FOLDER}/privkey.pem" ]
then mkdir -p "${KEYS_FOLDER}" &&
echo "SSL certificates are not present creating dummy ones" &&
openssl req -batch -newkey rsa:2048 -new -nodes -x509 -days 2 -keyout "${KEYS_FOLDER}"/privkey.pem -out "${KEYS_FOLDER}"/fullchain.pem
fi

sh watch-for-certificate-updates.sh &
sleep 2

# Running entrypoint script from base image
sh docker-entrypoint.sh nginx -g "daemon off;"
