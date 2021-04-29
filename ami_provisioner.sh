#!/bin/bash -xe

# this packer ami provisioner script will run as ec2-user
echo "Connected via SSM"
echo "Packer build name: '$PACKER_BUILD_NAME'"
