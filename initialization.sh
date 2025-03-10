#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
git clone https://github.com/AskyuConsultoria/Gestio-front-api.git

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo docker build -t website-image -f Gestio-deployment-website/install_website.dockerfile .
sudo docker run --name website-container -d -p 80:80 website-image
