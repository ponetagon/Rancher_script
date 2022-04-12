###### Master Server ########

#!/bin/bash

##### update #####

apt update -y
apt upgrade -y

##### install docker #####

curl https://releases.rancher.com/install-docker/20.10.sh | sh

###############################################################
####################### install chrony ########################
###############################################################

timedatectl set-timezone Asia/Bangkok
apt install chrony -y
sed -i 's/pool/#pool/g'  /etc/chrony/chrony.conf
sed -i 's/#pool 2.ubuntu.#pool.ntp.org iburst maxsources 2/server clock.inet.co.th/g'  /etc/chrony/chrony.conf
systemctl restart chrony

###############################################################
######################### Swapoff #############################
###############################################################

swapoff -a
sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab

##############################################################
##############################################################
##############################################################