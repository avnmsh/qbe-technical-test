#!/bin/bash
# Update and install necessary packages with basic Hardening Steps
sudo apt-get update -y
sudo apt install -y ufw
sudo ufw enable
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw status
sudo ufw reload

#Install nginx
sudo apt-get install -y nginx

#Update hello endpoint which should generate response : world  [GET /hello/ HTTP/1.1] 

nginx_config="/etc/nginx/sites-available/default"

# Define the content to add for the hello endpoint
hello_endpoint_config=$(cat <<EOL
    location /hello/ {
        default_type text/plain;
        return 200 'world';
    }
EOL
)

# Use awk to insert the hello endpoint configuration just before last uncommented '}' in default file
awk -v hello_endpoint="$hello_endpoint_config" '{
    if ($0 ~ /^}$/) {
        if (comment_started) {
            comment_started = 0;
        } else {
            print hello_endpoint;
            print;
            comment_started = 1;
            next;
        }
    }
    if (!comment_started) {
        print;
    }
}' "$nginx_config" | sudo tee "$nginx_config" > /dev/null

# Check the Nginx configuration syntax
nginx -t

# If the configuration syntax is valid, reload Nginx to apply the changes
if [ $? -eq 0 ]; then
    sudo systemctl reload nginx
    echo "Nginx configuration updated. The /hello/ endpoint has been added."
else
    echo "Nginx configuration syntax is invalid. Changes not applied."
fi