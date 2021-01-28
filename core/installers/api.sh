rm -Rf /nginx/*.default
service nginx restart
mkdir -p /nginx/config
mkdir -p /nginx/live
curl -s > /nginx/live/web.conf
curl -s >
