     #!/bin/bash
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install docker -y 
    git clone https://github.com/AskyuConsultoria/Gestio-front-api.git
    sudo docker run --name website -d -p 80:80 install_website .
  
