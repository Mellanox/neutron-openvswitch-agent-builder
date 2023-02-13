#!/bin/bash
LOG_DIR_HOST=/var/log/neutron
CONF_DIR_HOST=/etc/neutron
IMAGE_NAME=${IMAGE_NAME:-ubuntu-binary-neutron-openvswitch-agent-yoga-aarch64}
CONTAINER_NAME=neutron_ovs_agent
NEUTRON_USER_ID=42435

# Create log file
mkdir -p ${LOG_DIR_HOST}
chown -R  ${NEUTRON_USER_ID}:${NEUTRON_USER_ID} ${LOG_DIR_HOST}

# Create container
docker container create \
--network host \
--user ${NEUTRON_USER_ID}:${NEUTRON_USER_ID} \
--privileged \
--name ${CONTAINER_NAME} \
--restart unless-stopped \
-v /run/openvswitch:/run/openvswitch/ \
-v ${LOG_DIR_HOST}:/var/log/neutron \
-v ${CONF_DIR_HOST}:/etc/neutron \
-v /etc/localtime:/etc/localtime \
-v ${PWD}:/usr/bin/scripts \
${IMAGE_NAME} \
bash /usr/bin/scripts/neutron_ovs_agent_launcher.sh

# Start container
docker start ${CONTAINER_NAME}
