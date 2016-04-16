# How to do this using layered clones

## Set up base vm
- create a base vm - I used ubuntu server - but I'd be tempted to use something smaller and quicker
- install virtualbox guest additions - its needed for guest control

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

