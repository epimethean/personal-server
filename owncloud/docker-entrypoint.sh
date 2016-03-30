#!/bin/bash
set -e

if [ ! -e '/var/www/html/owncloud/version.php' ]; then
  # Owncloud detects webroot using url, so put owncloud in its own subdir
  mkdir -p /var/www/html/owncloud
  cd /var/www/html/owncloud
  tar cf - --one-file-system -C /usr/src/owncloud . | tar xf -
  chown -R www-data /var/www/html
fi

exec "$@"
