#! /bin/bash
set -ex

softRestart() {
	VBoxManage controlvm $1 acpipowerbutton
	until VBoxManage startvm --type=separate $1; do sleep 3; done
}

vmCopy() {
	VBoxManage guestcontrol $1 --username root --password root copyto /Users/mike/workspace/networking-examples/1-basic-routing/$2 --target-directory $3
}

vmRun() {
	VBoxManage guestcontrol $1 --username root --password root run -- $2
}

# Create echo server
VBoxManage clonevm "Ubuntu ReadOnly" --snapshot=base --options=link --name="1-echo" --register
VBoxManage modifyvm 1-echo --nic1=intnet --intnet1=1-remote --groups /NetTest/1-basic-routing
VBoxManage startvm 1-echo --type=headless
until vmCopy 1-echo echo/interfaces /etc/network/interfaces; do	sleep 5; done
sleep 1
softRestart 1-echo

# Create router
VBoxManage clonevm "Ubuntu ReadOnly" --snapshot=base --options=link --name="1-router" --register
VBoxManage modifyvm 1-router --nic1=intnet --intnet1=1-remote --nic2=intnet --intnet2=1-local --groups /NetTest/1-basic-routing
VBoxManage startvm 1-router --type=headless
until vmCopy 1-router router/interfaces /etc/network/interfaces; do sleep 5; done
vmRun 1-router "/sbin/sysctl -w net.ipv4.ip_forward=1"
softRestart 1-router

