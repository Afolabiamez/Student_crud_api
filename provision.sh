#!/bin/bash

echo "Updating system and installing Docker..."
sudo apt-get update
sudo apt-get install -y docker.io docker-compose

echo "Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Installing NGINX..."
sudo apt-get install -y nginx

echo "Starting NGINX service..."
sudo systemctl enable nginx
sudo systemctl start nginx

echo "Pulling your app image from Docker Hub..."
docker pull amezdoc/student-api:main  

echo "Done provisioning. Ready for docker-compose up!"



# #!/bin/bash

# # Update and install dependencies
# sudo apt update
# sudo apt install -y docker.io docker-compose nginx

# # Enable docker
# sudo systemctl start docker
# sudo systemctl enable docker

# # Add vagrant user to docker group
# sudo usermod -aG docker vagrant

# # Clean any previous Nginx config and copy our own later
# sudo rm /etc/nginx/sites-enabled/default

# echo "Provisioning complete. Run 'vagrant ssh' to enter the VM."
