rm -Rf /nginx/*.default
service nginx restart
mkdir -p /nginx/config
mkdir -p /nginx/live
curl -s https://raw.githubusercontent.com/theraw/dope-gg-api/master/core/installers/configs/nginx/live/web.conf > /nginx/live/web.conf
curl -s https://raw.githubusercontent.com/theraw/dope-gg-api/master/core/installers/configs/nginx/config/gzip.conf > /nginx/config/gzip.conf
curl -s https://raw.githubusercontent.com/theraw/dope-gg-api/theraw-static/nginx/config/php72.conf > /nginx/config/php72.conf
curl -s https://raw.githubusercontent.com/theraw/dope-gg-api/theraw-static/nginx/config/errors_json.conf > /nginx/config/errors_json.conf
curl -s https://raw.githubusercontent.com/theraw/dope-gg-api/theraw-static/nginx/config/api_keys.conf > /nginx/config/api_keys.conf
service nginx restart


