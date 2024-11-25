#!/bin/bash

# Verifica se o script foi executado com os devidos privilégios
if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[31mEste script precisa ser executado como root\033[0m"
    exit 1
fi

#Verifica se o Docker está instalado
if command -v docker >/dev/null 2>&1; then
    echo -e "\033[32mO Docker já está instalado\!\033[0m"
    exit 0
fi

echo -e "\033[1;33mInstalando docker...\033[0m"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh
sudo rm -f get-docker.sh

# Verifica se o Docker foi instalado
if command -v docker &> /dev/null; then
    echo -e "\033[32mO Docker foi instalado com sucesso\033[0m"
else
    echo -e "\033[31mHouve um erro na instalação do docker\033[0m"
    exit 1
fi

sudo systemctl start docker
sudo systemctl enable docker