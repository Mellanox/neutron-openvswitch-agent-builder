# neutron-openvswitch-agent-builder
##neutron-openvswitch-agent-builder
This repository implements a neutron openvswith agent ubuntu image container to be run on arch64 platform  

##Build image  

You can build the image on linx aarch64 platform using docker build or using docker buildx on other linux platforms by running the following script:  
```
cd build
bash build.sh
```

##Build and start container  
On linux aarch64 platform the the following script to start the neutron openvswitch agent container:  
```
bash neutron_ovs_agent_start.sh
```

