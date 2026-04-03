#!/bin/bash
username=ansible
sshkey="pub"
id_ed25519="secret"
id_ed25519_pub="pub"
useradd -m -d /home/$username -s /bin/bash $username
mkdir -p /home/$username/.ssh && touch /home/$username/.ssh/authorized_keys && touch /home/$username/.ssh/id_ed25519 && touch /home/$username/.ssh/id_ed25519.pub
chown -R $username:$username /home/$username/.ssh
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys && chmod 600 /home/$username/.ssh/id_ed25519 && chmod 600 /home/$username/.ssh/id_ed25519.pub
echo $sshkey > /home/$username/.ssh/authorized_keys
echo $id_ed25519 > /home/$username/.ssh/id_ed25519
echo $id_ed25519_pub > /home/$username/.ssh/id_ed25519.pub
usermod -aG sudo $username
echo "$username ALL=(ALL) NOPASSWD:ALL" >>  /etc/sudoers.d/$username