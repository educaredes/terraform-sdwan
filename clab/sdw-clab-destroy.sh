#!/bin/bash

echo 'Destroying containerlab Internet scenario...'

./sdw-clab-consoles.sh close
sudo containerlab destroy --topo sdedge-nfv-internet.yaml
sudo rm -Rf /tmp/.clab
sudo ovs-vsctl --if-exists del-br Internet

echo 'Done!'

echo ''
echo ''

echo 'All done!'
