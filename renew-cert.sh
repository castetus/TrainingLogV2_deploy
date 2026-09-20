#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

sudo docker run --rm \
  -v deploy_certbot_webroot:/var/www/certbot \
  -v deploy_letsencrypt:/etc/letsencrypt \
  certbot/certbot renew \
  --webroot \
  --webroot-path=/var/www/certbot

sudo docker compose \
  --env-file .env \
  --env-file versions.env \
  exec frontend nginx -s reload