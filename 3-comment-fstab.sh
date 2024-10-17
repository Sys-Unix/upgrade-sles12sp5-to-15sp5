#!/bin/bash

# Caminho do arquivo fstab
FSTAB_FILE="/etc/fstab"

# Fazer um backup do arquivo fstab antes de editar
cp "$FSTAB_FILE" "$FSTAB_FILE.bak"

# Processar o arquivo fstab e comentar todas as linhas, exceto a linha do ROOT
awk '/\/dev\/disk\/by-label\/ROOT \/ ext4 defaults 0 0/ {print; next} {print "#" $0}' "$FSTAB_FILE.bak" > "$FSTAB_FILE"

echo "Linhas comentadas com sucesso, exceto a linha do ROOT. Backup do arquivo original foi salvo em $FSTAB_FILE.bak"
