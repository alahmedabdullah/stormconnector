#!/bin/sh
# version 2.0

yum -y update

#"install docker"
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#yum-config-manager --save --setopt=openstack-icehouse.skip_if_unavailable=true
yum install -y docker-ce

#"install docker - convenient shell"
#yum install -y curl yum-utils
#yum check-update
#yum-config-manager --save --setopt=openstack-icehouse.skip_if_unavailable=true
#curl -s https://get.docker.com/ | sh

#fix error
#mkdir -p /etc/systemd/system/containerd.service.d/
#echo "[Service]" > override.conf
#echo "ExecStartPre=" >> override.conf
#mv override.conf /etc/systemd/system/containerd.service.d/
#sed -i "s/.*ExecStart.*/ExecStart=\/usr\/bin\/dockerd -H/" /usr/lib/systemd/system/docker.service
#sudo mkdir -p /etc/systemd/system/docker.service.d/
#sudo echo "[Service]" > override2.conf
#sudo echo "ExecStart=" >> override2.conf
#sudo echo "ExecStart=/usr/bin/dockerd" >> override2.conf
#sudo echo "ExecStart=/usr/bin/dockerd --storage-opt dm.thinpooldev=/dev/mapper/docker-thinpool" >> override2.conf
#mv override2.conf /etc/systemd/system/docker.service.d/

#systemctl daemon-reload
#systemctl restart containerd.service
#systemctl show containerd.service

systemctl start docker
systemctl status docker
#systemctl enable docker
usermod -aG docker ec2-user

#pull storm image from docker hub
docker pull movesrwth/storm:travis
