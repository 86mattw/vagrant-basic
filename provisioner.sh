
apt-get update
apt-get -y upgrade

apt-get install -y apache2

echo "ServerName localhost" > /etc/apache2/httpd.conf

VHOST=$(cat <<EOF
<VirtualHost *:80>
  DocumentRoot "/var/www/public"
  ServerName localhost
  <Directory "/var/www/public">
    AllowOverride All
  </Directory>
</VirtualHost>
EOF)

echo "${VHOST}" > /etc/apache2/sites-enabled/000-default.conf

service apache2 reload

apt-get install -y php5
