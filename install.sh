#!/bin/bash

#############################################################################
#                                                                           #  
#   Adicione permissão de execução a este script com chmod +x start.sh      #
#   Execute esse script com root ou usando sudo                             #
#                                                                           #
#############################################################################



# Valida se o script foi executado com os devidos privilégios
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script precisa ser executado como root"
    exit 1
fi

# Verifica se o git já está instalado
if ! command -v git --version > /dev/null; then
    echo "Git não está instalado"
    exit 1
fi

git clone https://github.com/andradesysadmin/homelab
cd homelab
sudo chmod +x start.sh
sudo ./start.sh
