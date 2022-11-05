#!/usr/bin/env sh

echo "backend address is ${BACKEND_ADDRESS}"
chmod +x /utility/wait_for_it.sh
bash /utility/wait_for_it.sh "${BACKEND_ADDRESS}" -t "${WAIT_FOR_IT_TIME}" -- echo "Backend is ready"

# If no certificates are obtained, create dummy ones to start the nginx
if [ ! -f "${KEYS_FOLDER}/privkey.pem" ]; then
  mkdir -p "${KEYS_FOLDER}" &&
  echo "SSL certificates are not present creating dummy ones" &&
  openssl req -batch -newkey rsa:2048 -new -nodes -x509 -days 2000 -keyout "${KEYS_FOLDER}"/privkey.pem -out "${KEYS_FOLDER}"/fullchain.pem
fi

sh watch-for-certificate-updates.sh &
sleep 2

# Running entrypoint script from base image
sh docker-entrypoint.sh nginx -g "daemon off;"
