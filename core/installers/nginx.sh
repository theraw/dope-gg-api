apt-get install g++ flex bison curl doxygen libyajl-dev libgeoip-dev libtool dh-autoreconf libcurl4-gnutls-dev libxml2 libpcre++-dev libxml2-dev -y
apt-get install libuuid1 uuid-dev -y
apt-get install libgd-dev libc6 -y
apt-get install libxslt-dev -y
apt-get install libxslt1-dev -y
apt-get install libgd2-xpm -y
apt-get install libgd2-xpm-dev -y
apt-get install libgeoip-dev -y
apt-get install libssl libssl-dev -y
apt-get install checkinstall libpcre3 libpcre3-dev zlib1g zlib1g-dbg libxml2 zlib1g-dev -y
mkdir -p /var/nginx
cd /tmp/; wget http://nginx.org/download/nginx-1.19.6.tar.gz; tar xf nginx-1.19.6.tar.gz; rm -Rf nginx-1.19.6.tar.gz; mv nginx-1.19.6 nginx
cd /tmp/nginx; ./configure                              \
--user=nginx                                      \
--group=nginx                                     \
--sbin-path=/usr/sbin/nginx                       \
--conf-path=/nginx/nginx.conf                     \
--pid-path=/var/run/nginx.pid                     \
--lock-path=/var/run/nginx.lock                   \
--error-log-path=/var/nginx/logs/error.log            \
--http-log-path=/var/nginx/logs/access.log            \
--with-pcre                                       \
--with-threads                                    \
--with-file-aio                                   \
--with-http_ssl_module                            \
--with-http_v2_module                             \
--with-http_realip_module                         \
--with-http_addition_module                       \
--with-http_xslt_module                           \
--with-http_image_filter_module                   \
--with-http_geoip_module                          \
--with-http_sub_module                            \
--with-http_dav_module                            \
--with-http_flv_module                            \
--with-http_mp4_module                            \
--with-http_gunzip_module                         \
--with-http_gzip_static_module                    \
--with-http_auth_request_module                   \
--with-http_random_index_module                   \
--with-http_secure_link_module                    \
--with-http_slice_module                          \
--with-http_stub_status_module                    \
--with-mail                                       \
--with-mail_ssl_module                            \
--with-stream                                     \
--with-stream_ssl_module                          \
--with-stream_realip_module                       \
--with-stream_geoip_module                        \
--with-ld-opt="-Wl,-rpath,/usr/local/lib/"

cd /tmp/nginx; make -j`nproc` && make install
rm -Rf /tmp/*
useradd nginx
curl -s https://raw.githubusercontent.com/theraw/dope-gg-api/master/core/installers/configs/nginx.conf > /nginx/nginx.conf