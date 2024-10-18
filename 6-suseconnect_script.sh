#!/bin/bash

# Solicitar o REGCODE do usuário
read -p "Digite o REGCODE: " REGCODE

# Executar os comandos SUSEConnect com o REGCODE fornecido
SUSEConnect -r "$REGCODE"
SUSEConnect -p sle-module-legacy/12/x86_64
SUSEConnect -p sle-module-web-scripting/12/x86_64
SUSEConnect -p sle-module-adv-systems-management/12/x86_64
SUSEConnect -p sle-module-public-cloud/12/x86_64
SUSEConnect -p sle-module-containers/12/x86_64
SUSEConnect -p sle-module-toolchain/12/x86_64
SUSEConnect -p sle-module-hpc/12/x86_64
SUSEConnect -p sle-module-cap-tools/12/x86_64
SUSEConnect -p sle-sdk/12.5/x86_64
SUSEConnect -p PackageHub/12.5/x86_64
SUSEConnect -p sle-ha/12.5/x86_64 -r "$REGCODE"

echo "Todos os comandos SUSEConnect foram executados com sucesso."
