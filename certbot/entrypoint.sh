#!/usr/bin/env sh

sh "echo \"Hello!\""
sh "wait_for_it.sh -t ${NGINX_ADDRESS} ${WAIT_FOR_IT_TIME} -- echo \"Nginx is ready\""

sleep infinity

#if [ ! -f "${KEYS_FOLDER}"/README ]
#then rm -r "${KEYS_FOLDER}" && echo "Deleted dummy certificate"
#fi
#
#certbot certonly --webroot -w /var/www/certbot --keep-until-expiring --email "${CERTBOT_EMAIL}" --agree-tos --no-eff-email -d "${DOMAIN_NAME}"
#
#trap exit TERM; while :; do certbot renew; sleep 12h & wait ${!}; done;