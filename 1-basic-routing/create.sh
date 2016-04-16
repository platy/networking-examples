#! /bin/bash
set -ex

# Create echo server
VBoxManage clonevm "Ubuntu ReadOnly" --snapshot=base --options=link --name="1-echo" --register
VBoxManage modifyvm 1-echo --nic1=intnet --intnet1=1-remote --groups /NetTest/1-basic-routing
VBoxManage startvm 1-echo --type=gui
#VBoxManage guestcontrol 1-echo --username ubuntu --password ubuntu copyto echo/interfaces /etc/network/interfaces

