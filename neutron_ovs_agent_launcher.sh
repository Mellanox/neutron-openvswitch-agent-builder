#!/bin/bash
set -xe
$(command -v python3 || command -v python) -m neutron.cmd.destroy_patch_ports  --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini
neutron-openvswitch-agent --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini --log-file=/var/log/neutron/neutron.log
