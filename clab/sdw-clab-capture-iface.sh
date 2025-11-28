#!/bin/bash

docker_name=$1
docker_iface=$2

# List of container names and interfaces
container_names=('clab-sdedge-nfv-internet-s1' 'clab-sdedge-nfv-internet-isp1' 'clab-sdedge-nfv-internet-isp2')
container_ifaces=('e1-1' 'e1-2' 'e1-3' 'mgmt0')
allcontainers=${container_names[*]}
allifaces=${container_ifaces[*]}

USAGE="
Usage:
  sdw-clab-capture-traffic <container_name> <interface>
    to open capture on specific container interface
    Valid values:
      <container_name>: $allcontainers
      <container_interface>: valid network interface in <container_name> $allifaces
"

if [ ! "$2" ] ; then
    echo ""
    echo "$USAGE"
    exit 1
fi

if docker ps -a --format '{{.Names}}' | grep -q "^${docker_name}$"; then
    echo "Capturing traffic from '{$docker_iface}' interface in '${docker_name}' docker container..."
    sudo ip netns exec $docker_name tcpdump -U -nni $docker_iface -w - | wireshark -k -i -
else
    echo "-- WARNING: container '${docker_name}' not started"
fi


