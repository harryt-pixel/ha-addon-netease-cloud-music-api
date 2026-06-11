#!/bin/sh

read_config() {
  node -e "
    const fs = require('fs');
    const opts = JSON.parse(fs.readFileSync('/data/options.json', 'utf8'));
    console.log(opts['$1'] !== undefined ? opts['$1'] : '$2');
  " 2>/dev/null
}

PORT=$(read_config port 3003)
ENABLE_FLAC=$(read_config enable_flac true)
CORS_ALLOW_ORIGIN=$(read_config cors_allow_origin "*")
ENABLE_GENERAL_UNBLOCK=$(read_config enable_general_unblock true)
SELECT_MAX_BR=$(read_config select_max_br false)
UNBLOCK_SOURCE=$(read_config unblock_source "pyncmd,qq,bodian,migu,kugou,kuwo")
ENABLE_PROXY=$(read_config enable_proxy false)
PROXY_URL=$(read_config proxy_url "")

export PORT
export ENABLE_FLAC
export CORS_ALLOW_ORIGIN
export ENABLE_GENERAL_UNBLOCK
export SELECT_MAX_BR
export UNBLOCK_SOURCE

if [ "$ENABLE_PROXY" = "true" ] && [ -n "$PROXY_URL" ]; then
    export ENABLE_PROXY=true
    export PROXY_URL
fi

echo "Starting NetEase Cloud Music API on port ${PORT}..."

cd /app || cd /opt || cd /usr/src/app || {
    echo "Error: Could not find app directory" >&2
    exit 1
}

exec node app.js
