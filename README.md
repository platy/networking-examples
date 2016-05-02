# TCP/IP Networking examples

As a learning tool I'm going to try implementing common linux networking configurations within VMs. Each example should have a Vagrantfile or similar which sets up a machine (probably using debian) or several machines with networks between them and some tests which show what they do.

I'm particularly interested with mesh networking, security, service discovery, zero configuration networks and scaling, but there are a lot of more basic examples which will need to be done before getting to those more advanced topics.

Initally it will all be IPv4, as that's still how most neworks are working, I'm also interested in implementing the equivalent for IPv6 which in some cases will look very different and also with some mixed network topics such as running them on top of each other or side-by-side.

These are to be networking administration examples and so will skip most things that are more in the domain of system adminsitration.

## 1. Basic routing

The most basic form of network routing is a node that sits on 2 networks and acts as a gateway between them. In the example we create and configure a gateway node and test that packets are routed by it between those 2 networks.

# Requirements

- VirtualBox 5.0.20+

