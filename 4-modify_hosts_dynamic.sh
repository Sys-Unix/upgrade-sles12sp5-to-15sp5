#!/bin/bash

# Capturar o hostname da máquina
HOSTNAME=$(hostname)

# Capturar o FQDN (Fully Qualified Domain Name)
FQDN=$(hostname -f)

# Capturar o IP da máquina (primeiro IP)
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Definir o caminho do arquivo hosts
HOSTS_FILE="/etc/hosts"

# Fazer backup do arquivo hosts
BACKUP_FILE="/etc/hosts.bak.$(date +%F_%T)"
cp $HOSTS_FILE $BACKUP_FILE
echo "Backup do /etc/hosts criado em $BACKUP_FILE"

# Comentar todas as linhas do arquivo original
sed -i '/^#/!s/^/#/' $HOSTS_FILE

# Adicionar o IP e hostname no formato especificado
echo "$IP_ADDRESS $FQDN $HOSTNAME" >> $HOSTS_FILE

echo "Arquivo /etc/hosts modificado. Todas as linhas foram comentadas, e a linha '$IP_ADDRESS $FQDN $HOSTNAME' foi adicionada."
