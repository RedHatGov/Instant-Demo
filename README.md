# Instant-Demo
Project to deploy complete demo environments on your laptop using Ansible playbooks

## Summary
The Instant-Demo project contains a number of Ansible playbooks and roles that will deploy, end-to-end, demo environments on KVM-based systems with the intent of offering field SAs a simple way to deploy a demo environment on his/her laptop.

## Roles

### ansible-prvs-libvirt-vm
This role will provision 1 or more VMs by using a combination of kickstart and virt-install
See the role's individual README for more details

### ansible-rhsm
This role will subscribe hosts to the RH portal.  It was designed to be used for this project and as such
extra variables can be defined to specify which product repos (in addition to rhel) should be enabled.
