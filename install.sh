find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chown -R :www-data . 
chmod u+x bin/magento
echo 'memory_limit = -1' >> /usr/local/etc/php/conf.d/docker-php-ram-limit.ini

bin/magento setup:install \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@email.com \
--admin-user=admin \
--admin-password='Password123' \
--backend-frontname=admin \
--db-host=mysql.magento \
--db-name=magento \
--db-user=magento \
--db-password=magento \
--use-rewrites=1 \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-secure-admin=1 \
--admin-use-security-key=1 \
--session-save=files \
--elasticsearch-host=elastic.magento \
--elasticsearch-port=9200 \
--amqp-host=rabbitmq.magento \
--amqp-port=5672 \
--amqp-user=rabbit \
--amqp-password=rabbit \
--cache-backend=redis \
--cache-backend-redis-server=redis \
--cache-backend-redis-db=0 \
--page-cache=redis \
--page-cache-redis-server=redis \
--page-cache-redis-db=1

bin/magento sampledata:deploy
bin/magento setup:upgrade
bin/magento cache:flush
