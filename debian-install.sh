#!/bin/bash
set -xe
sudo apt-get install curl
sudo apt-get install gpg

#install - influxdb & cli client
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update && sudo apt-get install influxdb influxdb-client

#verify
curl -sL https://repos.influxdata.com/influxdb.key | gpg --import
wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.10_linux_amd64.tar.gz.asc
gpg --verify influxdb-1.7.10_linux_amd64.tar.gz.asc influxdb-1.7.10_linux_amd64.tar.gz


#install - postgres
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib


#install - grafana
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -


# Alternatively you can add the beta repository, see in the table above
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"


sudo apt-get update
sudo apt-get install grafana
