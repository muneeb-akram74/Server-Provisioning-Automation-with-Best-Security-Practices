#!/bin/bash

# Secure Automated Web Server Setup (Apache/Nginx)
# Author: [Your Name]
# Date: [YYYY-MM-DD]
# Description: This script sets up a secure web server on a Linux instance.

# Variables
OS=""
WEB_SERVER="apache"
NON_ROOT_USER="webadmin"

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
fi

# Create a Non-Root User
if ! id "$NON_ROOT_USER" &>/dev/null; then
    sudo useradd -m -s /bin/bash "$NON_ROOT_USER"
    sudo passwd -l "$NON_ROOT_USER" # Lock password to prevent login
    echo "Created user: $NON_ROOT_USER"
fi

# Configure Firewall
echo "Configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable -y

# Install Web Server and Security Tools
echo "Installing Web Server..."
if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    sudo apt update -y
    sudo apt install -y apache2 fail2ban unattended-upgrades
    sudo systemctl enable --now apache2
elif [[ "$OS" == "centos" || "$OS" == "rhel" ]]; then
    sudo yum update -y
    sudo yum install -y httpd fail2ban
    sudo systemctl enable --now httpd
else
    echo "Unsupported OS!"
    exit 1
fi

# Secure Apache Configuration (Ubuntu)
if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    sudo bash -c 'cat > /etc/apache2/conf-available/security.conf <<EOF
ServerTokens Prod
ServerSignature Off
TraceEnable Off
<Directory />
    Options -Indexes
    AllowOverride None
</Directory>
EOF'
    sudo a2enconf security
    sudo systemctl restart apache2
fi

# Deploy a Secure Web Page
echo "<h1>Secure Web Server</h1>" | sudo tee /var/www/html/index.html > /dev/null

# Enable Automatic Security Updates
if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    sudo dpkg-reconfigure --priority=low unattended-upgrades
elif [[ "$OS" == "centos" || "$OS" == "rhel" ]]; then
    sudo yum install -y yum-cron
    sudo systemctl enable --now yum-cron
fi

# Print Security Report
echo "SECURITY REPORT:"
echo "1. Web Server Installed and Running"
echo "2. Firewall Configured"
echo "3. Fail2Ban Installed"
echo "4. Automatic Security Updates Enabled"
echo "Access your server at: http://$(hostname -I | awk '{print $1}')" 
