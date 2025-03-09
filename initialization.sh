#!/bin/bash

# Atualizar a lista de pacotes
echo "Atualizando lista de pacotes..."
sudo apt-get update -y

# Instalar pacotes necessários
echo "Instalando dependências..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Criar diretório para chaves do Docker e baixar a chave GPG
echo "Adicionando chave GPG oficial do Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Adicionar o repositório Docker ao APT sources
echo "Adicionando repositório Docker ao APT..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizar novamente para pegar os pacotes do repositório Docker
echo "Atualizando repositórios novamente..."
sudo apt-get update -y

# Instalar o Docker
echo "Instalando Docker..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verificar a instalação do Docker
echo "Verificando se o Docker foi instalado corretamente..."
sudo docker --version
if [ $? -eq 0 ]; then
    echo "Docker instalado com sucesso!"
else
    echo "Erro na instalação do Docker!"
    exit 1
fi

# Clonar o repositório do projeto
echo "Clonando repositório Gestio-front-api..."
git clone https://github.com/AskyuConsultoria/Gestio-front-api.git

# Construir a imagem Docker
echo "Construindo a imagem Docker..."
sudo docker build -t website-image -f G
