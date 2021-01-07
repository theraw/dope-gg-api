apt install -y php7.2 php7.2-fpm
apt install -y php7.2-common php7.2-cgi php7.2-cli php7.2-phpdbg php7.2-dev php7.2-curl 
apt install -y php7.2-enchant php7.2-gd php7.2-gmp php7.2-imap php7.2-interbase 
apt install -y php7.2-intl php7.2-ldap php7.2-mcrypt php7.2-readline php7.2-odbc 
apt install -y php7.2-pgsql php7.2-pspell php7.2-recode php7.2-snmp php7.2-tidy 
apt install -y php7.2-xmlrpc php7.2-xsl php7.2-json php7.2-sybase php7.2-sqlite3 
apt install -y php7.2-mysql php7.2-bz2 php7.2-bcmath php7.2-mbstring php7.2-soap 
apt install -y php7.2-xml php7.2-zip php7.2-dba 
service php7.2-fpm restart

curl -s $CDN/7.2/www.conf > /etc/php/7.2/fpm/pool.d/www.conf
ex -sc '%s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g|x' /etc/php/7.2/fpm/php.ini
ex -sc '%s/output_buffering = 4096/output_buffering = Off/g|x' /etc/php/7.2/fpm/php.ini
perl -pi -e 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/g' /etc/php/7.2/fpm/php.ini
perl -pi -e 's/;error_log = syslog/error_log = php_error.log/g' /etc/php/7.2/fpm/php.ini
perl -pi -e 's/;date.timezone =/date.timezone = UTC/g' /etc/php/7.2/fpm/php.ini
service php7.2-fpm restart

