# How to do this using layered clones

## Set up base vm
- create a base vm - I used ubuntu server - but I'd be tempted to use something smaller and quicker
- enable the root user
- install dkms & virtualbox guest additions - its needed for guest control
- set eth0 as 'allow-hotplug' so that the test vms wont wait for DHCP to start up for initial configuration

## Create the test setup
- create layered clones for each of the test machines
- group the vms for each test
- add them to the relevent internal networks to connect to each other in vbox
- start them
- configure their networks

## Test
- run test

Configuring and testing should be possible using [VBox guest control](https://www.virtualbox.org/manual/ch08.html#vboxmanage-guestcontrol)

I think that the tests need to be run from a test probe - that way we dont mess with the host networking at all.

But it would be nice to be able to use wireshark on interfaces - but without fucking up the host networking - maybe its something for when we have things more automated.

To configure the networking on the hosts I want to use guestcontrol copyto - but it seems that has been [broken for 9 months and Oracle made a fix yesterday](https://www.virtualbox.org/ticket/14336) - so I'll either have to do it another way or wait for the next release (probably in about 3 weeks according to their release frequency).

