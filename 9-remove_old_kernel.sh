#!/bin/bash

# Definir os pacotes a serem instalados
PACKAGES="SLES15-Migration suse-migration-sle15-activation"

# Executar a instalação com aprovação automática
zypper --non-interactive in $PACKAGES

# Verificar se a instalação foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Pacotes $PACKAGES foram instalados com sucesso."
    
    # Executar suse-migration-pre-checks com o parâmetro --fix
    suse-migration-pre-checks --fix
    
    # Verificar se o comando foi executado com sucesso
    if [ $? -eq 0 ]; then
        echo "Comando 'suse-migration-pre-checks --fix' executado com sucesso."

        # Listar kernels instalados
        echo "Listando kernels instalados:"
        rpm -qa | grep kernel-default

        # Identificar o kernel mais antigo
        OLD_KERNEL=$(rpm -qa 'kernel-default' | sort -V | head -n 1)
        CURRENT_KERNEL=$(uname -r)

        echo "Kernel atual: $CURRENT_KERNEL"
        echo "Kernel mais antigo identificado: $OLD_KERNEL"

        # Verificar se o kernel mais antigo é diferente do kernel atual
        if [[ "$OLD_KERNEL" != *"$CURRENT_KERNEL"* ]]; then
            echo "Removendo o kernel mais antigo: $OLD_KERNEL"
            zypper --non-interactive remove $OLD_KERNEL

            if [ $? -eq 0 ]; then
                echo "Kernel $OLD_KERNEL removido com sucesso."
            else
                echo "Erro ao remover o kernel $OLD_KERNEL."
            fi
        else
            echo "O kernel mais antigo é o kernel em uso, não será removido."
        fi
    else
        echo "Erro ao executar o comando 'suse-migration-pre-checks --fix'."
    fi
else
    echo "Erro ao instalar os pacotes $PACKAGES."
fi
