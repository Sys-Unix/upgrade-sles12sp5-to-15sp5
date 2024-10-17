#!/bin/bash

# Remove arquivos de configuração
rm -f /etc/SUSEConnect
rm -f /etc/zypp/{repos,services,credentials}.d/*
rm -f /usr/lib/zypp/plugins/services/*
rm -f /etc/sysconfig/rhn/systemid

# Limpar registros de nuvem
registercloudguest --clean

# Remover pacotes com Zypper e confirmar automaticamente
zypper -n rm cloud-regionsrv-client regionServiceClientConfigEC2 regionServiceCertsEC2
zypper -n rm -u salt salt-minion python*-salt sle-manager-tools-release
zypper -n rm -u spacewalksd spacewalk-check zypp-plugin-spacewalk spacewalk-client-tools osad python2-zypp-plugin-spacewalk python2-spacewalk-check python2-spacewalk-client-setup
zypper -n rm SUSE-Manager-Server-release-POOL-3.2-1.4.x86_64

# Parar e remover o Salt Minion e seus pacotes
systemctl stop salt-minion
systemctl stop venv-salt-minion

# Remover pacotes com RPM e forçar a remoção se necessário
rpm -e venv-salt-minion-3006.0-3.49.3.x86_64 --nodeps
rpm -e venv-salt-minion-3006.0-3.52.3.x86_64 --nodeps
rpm -e salt-minion-3000-74.1.x86_64 --nodeps
rpm -e python2-salt-3000-74.1.x86_64 --nodeps
rpm -e salt salt-minion python3-salt sle-manager-tools-release --nodeps
rpm -e spacewalk-client-setup spacewalksd spacewalk-check zypp-plugin-spacewalk osad python2-zypp-plugin-spacewalk python2-spacewalk-check python2-spacewalk-client-setup --nodeps

# Limpar diretórios de configuração do Salt
rm -rf /etc/salt/
rm -rf /etc/venv-salt-minion/
rm -rf /etc/zypp/{credentials,services,repos}.d/*
rm -rf /etc/sysconfig/rhn/

# Confirma a remoção de todos os pacotes e dependências automaticamente
zypper -n remove sle-manager-tools-release sle-manager-tools-release-POOL

echo "Processo de limpeza e remoção de pacotes concluído com sucesso."
