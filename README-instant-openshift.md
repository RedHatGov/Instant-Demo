#  Summary
`instant-openshift.sh` is a bash script which uses a series of roles and playbooks to build a single-node openshift cluster from start to finish.  This is intended for individuals who wish to quickly build openshift on their KVM-based hypervisor.
This type of openshift deployment is useful for Red Hatters who need complete OpenShift demo environment but have little time or energy to perform a multi-node deployment and do not wish to use minishift for whatever reason.

## Requirements
* custom variables file to include specs on VM such as memory, cpu, disk, etc.
* see ocp_example_vars.yml

## playbooks
* `pre-ocp-install.yml`
* `prerequisites.yml`
* `deploy_cluster.yml`
* `post-ocp-install.yml`

## Roles
* `ansible-prvsn-libvirt-vm`
* `ansible-rhsm`
* `openshift-prep`

## Step by step workflow, i.e. here is what happens when you run this script
* Prompt user for Red Hat userid and password - These are now required during the openshift installation and get passed to the ocp inventory as oreg_auth_user and oreg_auth_password
* Provision libvirt VM
* Install ssh authorized_key on new VM
* Register new VMs and enable openshift repos - This step uses the ansible-rhsm role
* Perform prerequisite steps for openshift install using the openshift-prep role.  This role installs packages, drops a ocp inventory template locally and grabs a copy of openshift-ansible from the new openshift node you just built.  
* Launch the playbook `openshift-install.yml` which imports (runs) the standard openshift playbooks `prerequisites.yml` and `deploy_cluster.yml`
* Launch the playbook `post-ocp-install.yml` to configure identity management and build a number of "demo" projects

### Variables
This playbook requires you to create a custom variables file to be named whatever you like and includes the following variables:

**custom variables file**

| Key | value | example | notes|
|-----|-------|---------|-------|
|**_guest_**|n/a    |top level list name||
|- name |hostname of VM| rhelvm||
|username|account to add to the new vm|bhirsch||
|cpu|number of vcpus| 4||
|mem|memory in MB|16384||
|iso|Location of installation media|/var/isos/rhel-server-7.5-x86_64-dvd.iso||
|**_os_**|n/a|second level list name||
|type|OS type|Linux||
|variant|OS variant|rhel7||
|**_disk_**|n/a|second level list name||
|size|size of OS disk|60||
|||||
|rhsm_activation_key| Red Hat Subscription Manager activation key |my-act-key||
|rhsm_org_id|Red Hat Subscription Manager organization ID|1234567||
|product|Red Hat product category - defines which repositories will be enabled| ocp|valid values can be found in README for ansible-rhsm role|

**Example**
```
# Options for the ansible-prvsn-libvirt-vm role
# Define VM builds and options
guest:
  - name: vm1.bhirsch.io
    username: bhirsch
    cpu: 4
    mem: 16384
    iso: /home/isos/rhel-server-7.5-x86_64-dvd.iso
    os:
      type: Linux
      variant: rhel7
    disk:
      size: 60

# Variables for the ansible-rhsm role
rhsm_activation_key: empsku_ak
rhsm_org_id: 11260385

# Define category of repos you want to enable.  Valid values include:
# ocp, satellite, cfme
product: ocp
```
