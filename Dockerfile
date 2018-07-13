FROM wordpress:4.8-apache
ADD plugins /usr/src/wordpress/wp-content/plugins
ADD plugins /var/www/html/wp-content/plugins

RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins
RUN chown -R www-data:www-data /var/www/html/wp-content/plugins
