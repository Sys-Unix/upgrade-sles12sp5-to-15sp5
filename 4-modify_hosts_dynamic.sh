#!/bin/bash

# Capturar o hostname da máquina
HOSTNAME=$(hostname)

# Capturar o FQDN (Fully Qualified Domain Name)
FQDN=$(hostname -f)

# Capturar o IP da máquina da interface 'eth0'
IP_ADDRESS=$(ip -o -4 addr show eth0 | awk '{print $4}' | cut -d/ -f1)

# Verificar se o comando 'ip' falhou e tentar usar 'ifconfig' como fallback
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS=$(ifconfig eth0 | grep 'inet ' | awk '{print $2}')
fi

# Definir o caminho do arquivo hosts
HOSTS_FILE="/etc/hosts"

# Fazer backup do arquivo hosts
BACKUP_FILE="/etc/hosts.bak.$(date +%F_%T)"
cp $HOSTS_FILE $BACKUP_FILE
echo "Backup do /etc/hosts criado em $BACKUP_FILE"

# Comentar todas as linhas do arquivo original, sem alterar o backup
sed -i '/^#/!s/^/#/' $HOSTS_FILE

# Adicionar o IP e hostname no formato especificado ao final do arquivo original
echo "$IP_ADDRESS $FQDN $HOSTNAME" >> $HOSTS_FILE

echo "Arquivo /etc/hosts modificado. Todas as linhas foram comentadas, e a linha '$IP_ADDRESS $FQDN $HOSTNAME' foi adicionada."
