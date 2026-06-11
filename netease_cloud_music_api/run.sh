#!/usr/bin/env bash

if ! command -v jq &>/dev/null; then
    if command -v apk &>/dev/null; then
        apk add --no-cache jq
    elif command -v apt-get &>/dev/null; then
        apt-get update -qq && apt-get install -y -qq jq
    fi
fi

CONFIG_PATH=/data/options.json

PORT=$(jq --raw-output '.port // 3000' "$CONFIG_PATH")
ENABLE_FLAC=$(jq --raw-output '.enable_flac // true' "$CONFIG_PATH")
CORS_ALLOW_ORIGIN=$(jq --raw-output '.cors_allow_origin // "*"' "$CONFIG_PATH")
ENABLE_GENERAL_UNBLOCK=$(jq --raw-output '.enable_general_unblock // true' "$CONFIG_PATH")
SELECT_MAX_BR=$(jq --raw-output '.select_max_br // false' "$CONFIG_PATH")
UNBLOCK_SOURCE=$(jq --raw-output '.unblock_source // "pyncmd,qq,bodian,migu,kugou,kuwo"' "$CONFIG_PATH")
ENABLE_PROXY=$(jq --raw-output '.enable_proxy // false' "$CONFIG_PATH")
PROXY_URL=$(jq --raw-output '.proxy_url // ""' "$CONFIG_PATH")

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
