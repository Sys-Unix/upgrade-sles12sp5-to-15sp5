#!/bin/bash

# Definir o caminho do arquivo
FILE="/etc/zypper/zypper.conf"

# Fazer backup do arquivo antes de qualquer modificação
BACKUP_FILE="/etc/zypper/zypper.conf.bak.$(date +%F_%T)"
cp $FILE $BACKUP_FILE
echo "Backup do arquivo criado em $BACKUP_FILE"

# Remover 'latest -1' da linha 'multiversion.kernels' e ajustar para 'latest,running'
sed -i 's/multiversion.kernels = latest -1,multiversion.kernels = latest,running/' $FILE

# Verificar se a modificação foi aplicada
if grep -q "multiversion.kernels = latest,running" "$FILE"; then
    echo "A linha 'multiversion.kernels = latest,running' foi modificada com sucesso no arquivo $FILE."
else
    echo "Erro ao modificar o arquivo $FILE."
fi
