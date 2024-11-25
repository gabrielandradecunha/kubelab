#!/bin/bash

#############################################################################
#                                                                           #  
#   Adicione permissão de execução a este script com chmod +x start.sh      #
#   Execute esse script com root ou usando sudo                             #
#                                                                           #
#############################################################################



# Valida se o script foi executado com os devidos privilégios
if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[31mEste script precisa ser executado como root\033[0m"
    exit 1
fi

# Tranforma todos os scripts do projeto em executáveis
find . -type f -name "*.sh" -exec chmod +x {} \;

# Executa os scripts do diretorio atual
sudo ./configs.sh

function apps() {
    # Loop para executar scripts contidos em apps/ e validar suas saídas
    for FILE in apps/*.sh; do
        sudo bash "$FILE"
        if [ $? -eq 0 ]; then
            echo "$FILE executado com sucesso."
        else
            echo "Erro ao executar $FILE"
            exit 1
        fi
    done
}

function manifestos() {
    # Loop para executar os manifestos kubernets em k8s/manifests/ 
    sudo kubectl apply -f 'k8s/manifests/*/namespace.yaml'
    sudo kubectl apply -f 'k8s/manifests/*/pvc.yaml'
    sudo kubectl apply -f  k8s/manifests/postgres/postgres-secret.yaml
    sudo kubectl apply -f 'k8s/manifests/*/deployment.yaml'
    sudo kubectl apply -f 'k8s/manifests/*/*service.yaml'

    if [ $? -eq 0 ]; then
        echo -e "\033[32mManifestos executados com sucesso\!\033[0m"

    else
        echo -e "\033[31mErro ao executar manifestos\033[0m"
    fi

    # Loop para garantir todos os objetos foram criados independente da ordem

}

# se tudo deu certo chama as funções
if [ $? -eq 0 ]; then
    apps
else
    echo -e "\033[31mErro ao baixar as aplicações\033[0m"
fi
if [ $? -eq 0 ]; then

    # tenta criar cluster com kind
    sudo kind create cluster --config k8s/kind/*.yaml
    CLUSTER_NAME="kubelab"

    CLUSTERS=$(kind get clusters)

    # Verifica se o nome do cluster existe na lista de clusters
    if echo "$CLUSTERS" | grep -q "$CLUSTER_NAME"; then
        echo -e "\033[1;32mO cluster '$CLUSTER_NAME' já existe.\033[0m"
    else
        echo -e "\033[1;33mO cluster '$CLUSTER_NAME' não foi encontrado, criando...\033[0m"
        # tenta criar cluster com kind
        sudo kind create cluster --config k8s/kind/*.yaml
    fi

else
    echo -e "\033[31mErro ao criar cluster\033[0m"
fi
if [ $? -eq 0 ]; then
    manifestos
else
    echo -e "\033[31mErro ao execultar manifestos\033[0m"
fi
