#! /bin/bash
set -e
SSH_PASSWD="root:Docker!"
URL=$1
apt-get install -y --no-install-recommends dialog \
&& apt-get install -y --no-install-recommends openssh-server \
&& echo "$SSH_PASSWD" | chpasswd \
&& curl ${URL}/sshd_config > /etc/ssh/sshd_config 


echo "Starting SSH ..."
service ssh start