#! /bin/bash
set -ex

# Create echo server
VBoxManage clonevm "Ubuntu ReadOnly" --snapshot=base --options=link --name="1-echo" --register
VBoxManage modifyvm 1-echo --nic1=intnet --intnet1=1-remote --groups /NetTest/1-basic-routing
VBoxManage startvm 1-echo --type=headless
until VBoxManage guestcontrol 1-echo --username root --password root copyto /Users/mike/workspace/networking-examples/1-basic-routing/echo/interfaces --target-directory /etc/network/interfaces; do
	sleep 5
done
sleep 1
VBoxManage controlvm 1-echo acpipowerbutton
until VBoxManage startvm 1-echo --type=gui; do sleep 1; done

