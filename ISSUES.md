# Issues network simulating with Vagrant

It's not clear to me whether these are issues with Vagrant or VirtualBox or just with my configuration - but it looks like to solve them I would have to do lots of VirtualBox override configuration and it's not clear that Vagrant would be providing an advantage.

1. Vagrant doesn't support "Internal networking" - meaning that the host must be present on all networks, this means:
  - the hosts interface listing will be clogged up with networks that it doesn't need to know about 
  - the host can't be used as the source for routing tests which should go through other nodes as it will route directly to all of them (another vm is required to run the tests)
2. Default routes are set up on all hosts via 10.0.2.2/24 on eth1 - and it seems that they all have routes to each other through that interface. It looks like Vagrant creates an NAT network by default that all of them are added to it uses this for ssh as it is NATing that from 2202, 2203, etc. 
3. The disk images for each vm are 10G and 1.6G on disk (have to overcome this problem for VBox anyway) - A potential solution (without vagrant) is to use VirtualBox linked clones which would then base a new vm from a snapshot - but I'm not sure if that gives the desired effect [VirtualBox clonevm](https://www.virtualbox.org/manual/ch08.html#vboxmanage-clonevm), another option would be to use a layered filesystem using AUFS or similar using a RO filesystem for the base - eg [AUFS root filesystem on USB flash](https://help.ubuntu.com/community/aufsRootFileSystemOnUsbFlash).

