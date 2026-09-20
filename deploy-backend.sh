#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

sudo docker compose \
  --env-file .env \
  --env-file versions.env \
  pull backend

sudo docker compose \
  --env-file .env \
  --env-file versions.env \
  up -d backend

sudo docker compose \
  --env-file .env \
  --env-file versions.env \
  exec backend npm run migrate