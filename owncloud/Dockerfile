FROM owncloud:8.2.3-apache
# Overwrite entrypoint to support an alternate web root
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY autoconfig.php /usr/src/owncloud/config
