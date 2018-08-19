#!/bin/bash

TMP_FOLDER=$(mktemp -d)
CONFIG_FILE='bitmoney.conf'
CONFIGFOLDER='/root/.bitmoney'

RED='\e[93m'
systemctl stop BITMONEY.service
echo -e "${RED}[ 25% ] STOPPING BIT MONEY SERVER${NC}"
sleep 10
echo -e "${RED}[ 50% ] BIT MONEY SERVER STOPPED SUCCESSFULLY${NC}"
function update_config() {
sed -i 's/daemon=1/daemon=1/' $CONFIGFOLDER/$CONFIG_FILE
cat << EOF >> $CONFIGFOLDER/$CONFIG_FILE
addnode=188.42.33.124
addnode=185.178.192.75
addnode=212.47.253.194
addnode=45.32.99.138
addnode=66.55.159.40
addnode=82.56.216.172
addnode=149.28.167.254
addnode=85.145.4.48
addnode=140.82.10.38
addnode=23.95.208.25
addnode=18.236.128.252
addnode=52.88.236.33
addnode=222.127.13.132
addnode=172.110.9.135
addnode=45.32.102.58
addnode=62.156.2.58
addnode=45.77.231.187
addnode=18.191.122.118
addnode=45.76.44.83
addnode=144.202.30.194
addnode=49.146.42.105
EOF
}
echo -e "${RED}[ 75% ] ADDING EXTRA NODES TO CONFIG FILE${NC}"
echo -e "${RED}[ 90% ] STARTING BIT MONEY SERVER${NC}"
systemctl start BITMONEY.service
sleep 5
echo -e "${RED}[ 100% ] BIT MONEY SERVER STARTED SUCCESSFULLY${NC}"
function setup_node() {
update_config
}
setup_node
