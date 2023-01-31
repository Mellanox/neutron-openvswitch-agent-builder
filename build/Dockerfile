FROM arm64v8/ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install software-properties-common -y && \
    dpkg --configure -a && add-apt-repository cloud-archive:zed -y && \
    apt-get update -y && apt-get install neutron-openvswitch-agent -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN if id -g neutron 2>/dev/null; \
      then groupmod -g 42435 neutron; \
    else groupadd -g 42435 neutron; \
    fi
RUN if id neutron 2>/dev/null; \
    then \
        usermod -s /usr/sbin/nologin -d /var/lib/neutron -u 42435 -g 42435  neutron; \
    else \
        useradd -s /usr/sbin/nologin -d /var/lib/neutron -u 42435 -g 42435  neutron; \
    fi

USER neutron
