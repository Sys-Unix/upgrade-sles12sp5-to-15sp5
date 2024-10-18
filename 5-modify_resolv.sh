#!/bin/bash

# Definir o caminho do arquivo resolv.conf
RESOLV_FILE="/etc/resolv.conf"

# Fazer backup do arquivo resolv.conf
BACKUP_FILE="/etc/resolv.conf.bak.$(date +%F_%T)"
cp $RESOLV_FILE $BACKUP_FILE
echo "Backup do /etc/resolv.conf criado em $BACKUP_FILE"

# Comentar todas as linhas do arquivo original, sem alterar o backup
sed -i '/^#/!s/^/#/' $RESOLV_FILE

# Adicionar a linha 'nameserver 8.8.8.8' ao final do arquivo original
echo "nameserver 8.8.8.8" >> $RESOLV_FILE

echo "Arquivo /etc/resolv.conf modificado. Todas as linhas foram comentadas, e a linha 'nameserver 8.8.8.8' foi adicionada."
