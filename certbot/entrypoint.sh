#!/usr/bin/env sh

chmod +x ./wait_for_it.sh
echo "./wait_for_it.sh -t ${WAIT_FOR_IT_TIME} ${NGINX_ADDRESS} -- echo \"Nginx is ready\""
sh -c "./wait_for_it.sh -t ${WAIT_FOR_IT_TIME} ${NGINX_ADDRESS} -- echo \"Nginx is ready\""

sleep infinity

#if [ ! -f "${KEYS_FOLDER}"/README ]
#then rm -r "${KEYS_FOLDER}" && echo "Deleted dummy certificate"
#fi
#
#certbot certonly --webroot -w /var/www/certbot --keep-until-expiring --email "${CERTBOT_EMAIL}" --agree-tos --no-eff-email -d "${DOMAIN_NAME}"
#
#trap exit TERM; while :; do certbot renew; sleep 12h & wait ${!}; done;