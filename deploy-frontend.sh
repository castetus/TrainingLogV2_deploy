#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

sudo docker compose \
  --env-file .env \
  --env-file versions.env \
  pull frontend

sudo docker compose \
  --env-file .env \
  --env-file versions.env \
  up -d frontend