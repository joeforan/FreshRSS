#!/bin/bash

set -euo pipefail

run_cmd () {
    echo "===================="
    echo "$1"
    echo "===================="
    eval "$1"
    echo "===================="
}

CMD=$(cat <<EOF
docker run --rm \
  -p 8080:80 \
  -e FRESHRSS_ENV=development \
  -e TZ=Asia/Tokyo \
  -e 'CRON_MIN=1,31' \
  -v $(pwd):/var/www/FreshRSS \
  -v freshrss_data:/var/www/FreshRSS/data \
  --name freshrss_dev \
  freshrss-dev
EOF
   )

run_cmd "$CMD"
