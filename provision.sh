echo '# Install NGINX'
apt-get -qq update 2>&1>/dev/null
apt-get -qq install nginx 2>&1>/dev/null

echo '# Install the maintenance configuration file'
cp /vagrant/maintenance.conf /etc/nginx/sites-available/default;

echo '# Install the custom maintenance page'
cp /vagrant/index.html /var/www/html/index.html

echo '# Generate self-signed SSL key and certificate'
openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt 2>/dev/null

echo '# Load the configuration'
systemctl reload nginx
