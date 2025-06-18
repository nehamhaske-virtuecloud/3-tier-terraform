#!/bin/bash
sudo apt update -y
sudo apt install -y nginx

# Custom homepage
echo "<h1>Welcome to Neha's Web Tier using NGINX!</h1>" | sudo tee /var/www/html/index.html

# Start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx
