if [ -z "${PUB_DEV_ACCESS_TOKEN}" ]; then
  echo "Missing PUB_DEV_ACCESS_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_REFRESH_TOKEN}" ]; then
  echo "Missing PUB_DEV_REFRESH_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_TOKEN_ENDPOINT}" ]; then
  echo "Missing PUB_DEV_TOKEN_ENDPOINT environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_EXPIRATION}" ]; then
  echo "Missing PUB_DEV_EXPIRATION environment variable"
  exit 1
fi

cat <<EOF > ~/.pub-cache/credentials.json
{
  "accessToken": "${PUB_DEV_ACCESS_TOKEN}",
  "refreshToken": "${PUB_DEV_REFRESH_TOKEN}",
  "tokenEndpoint": "${PUB_DEV_TOKEN_ENDPOINT}",
  "scopes": ["https://www.googleapis.com/auth/userinfo.email","openid"],
  "expiration": "${PUB_DEV_EXPIRATION}",
}
EOF