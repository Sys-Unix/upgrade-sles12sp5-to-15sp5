#!/bin/bash

# Definir o caminho do arquivo
FILE="/etc/sle-migration-service.yml"

# Criar o arquivo com o conteúdo desejado
cat <<EOL > $FILE
verbose_migration: true
#debug: true
EOL

# Verificar se o arquivo foi criado corretamente
if [ -f "$FILE" ]; then
    echo "Arquivo $FILE criado com sucesso."
else
    echo "Erro ao criar o arquivo $FILE."
fi
