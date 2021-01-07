cd /usr/local; wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar xf ioncube_loaders_lin_x86-64.tar.gz; rm -Rf ioncube_loaders_lin_x86-64.tar.gz
echo 'zend_extension = "/usr/local/ioncube/ioncube_loader_lin_7.2.so"' >> /etc/php/7.2/fpm/php.ini
echo 'zend_extension = "/usr/local/ioncube/ioncube_loader_lin_7.2.so"' >> /etc/php/7.2/cli/php.ini