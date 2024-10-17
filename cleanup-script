rm /etc/SUSEConnect
rm -f /etc/zypp/{repos,services,credentials}.d/*
rm -f /usr/lib/zypp/plugins/services/*
registercloudguest --clean
zypper rm cloud-regionsrv-client
zypper rm regionServiceClientConfigEC2 regionServiceCertsEC2
systemctl stop salt-minion
systemctl stop venv-salt-minion
rpm -e venv-salt-minion-3006.0-3.49.3.x86_64
rpm -e venv-salt-minion-3006.0-3.52.3.x86_64
rpm -e salt-minion-3000-74.1.x86_64
sudo rpm -e --nodeps python2-salt-3000-74.1.x86_64
rm -r /etc/salt/
rm -r /etc/venv-salt-minion/
rpm -e salt salt-minion python3-salt
rpm -e salt venv-salt-minion python3-salt
zypper rm -u salt salt-minion python*-salt sle-manager-tools-release
rpm -e salt salt-minion python3-salt sle-manager-tools-release
rpm -e salt salt-minion python2-salt sle-manager-tools-release
systemctl stop venv-salt-minion; zypper rm -y venv-salt-minion; rm -rf /etc/zypp/{credentials,services,repos}.d/* /etc/venv-salt-minion/*
zypper rm -u spacewalksd spacewalk-check zypp-plugin-spacewalk spacewalk-client-tools osad python2-zypp-plugin-spacewalk python2-spacewalk-check python2-spacewalk-client-setup
rpm -e spacewalk-client-setup spacewalksd spacewalk-check zypp-plugin-spacewalk osad python2-zypp-plugin-spacewalk python2-spacewalk-check python2-spacewalk-client-setup
rm /etc/sysconfig/rhn/systemid
zypper rm SUSE-Manager-Server-release-POOL-3.2-1.4.x86_64
rm /etc/zypp/repos.d/susemanager\:channels.repo
rm -r /etc/sysconfig/rhn/
