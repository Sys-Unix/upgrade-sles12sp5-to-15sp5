#!/bin/bash

# Encontrar a partição de swap em uso
SWAP_DEVICE=$(swapon --show=NAME --noheadings)

# Verificar se há uma partição de swap ativa
if [ -z "$SWAP_DEVICE" ]; then
    echo "Nenhuma partição de swap ativa encontrada."
else
    echo "Partição de swap ativa encontrada: $SWAP_DEVICE"
    
    # Desativar a partição de swap
    echo "Desativando swap em $SWAP_DEVICE..."
    swapoff "$SWAP_DEVICE"
    
    if [ $? -eq 0 ]; then
        echo "Swap desativado com sucesso."
    else
        echo "Erro ao desativar o swap."
    fi
fi
