# Playbook Summary
`provision-libvirt-vm.yml` builds virtual machines on your KVM hypervisor, registers those with RH, and enables repos based on selections you make in a custom variables file.

## Requirements
* custom variables file
* public ssh key
* All requirements specified by the Roles

## Roles
* `ansible-prvsn-libvirt-vm`
* `ansible-rhsm`

## Plays
* Provision libvirt VMs
* Install ssh authorized_key on new VMs
* Register new VMs and enable repos

### Variables
This playbook requires you to create a custom variables file to be named whatever you like and includes the following variables:

**custom variables file**

| Key | value | example | notes|
|-----|-------|---------|-------|
|**_guest_**|n/a    |top level list name||
|- name |hostname of VM| rhelvm||
|username|account to add to the new vm|bhirsch||
|cpu|number of vcpus| 2||
|mem|memory in MB|8192||
|iso|Location of installation media|/var/isos/rhel-server-7.5-x86_64-dvd.iso||
|**_os_**|n/a|second level list name||
|type|OS type|Linux||
|variant|OS variant|rhel7||
|**_disk_**|n/a|second level list name||
|size|size of OS disk|10||
|||||
|rhsm_activation_key| Red Hat Subscription Manager activation key |my-act-key||
|rhsm_org_id|Red Hat Subscription Manager organization ID|1234567||
|product|Red Hat product category - defines which repositories will be enabled| ocp|valid values can be found in README for ansible-rhsm role|
