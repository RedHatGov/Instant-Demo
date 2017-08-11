# libvirtVM
**this is a work in progress**

I have created a *createVM* which will create a shell of a VM.  It relies on an
XML file which is very configurable.  For example, I have used the
`roles/createVM/defaults/main.yml` file to house some initial ones...which leads
me to say that you'll need to modify that as well because I hardcoded where the
VM disk image should reside.  You also may want to change the VM hostnames in
the inventory file...

All the same, I can create a VM shell using:

```
git clone https://github.com/dswhitley/libvirtVM.git
cd libvirtVM
ansible-playbook libvirtVM.yml
```

So the Ansible *virt* module really relies on a pretty customizable XML file.  I
am not very familiar with this file yet, but [here](https://libvirt.org/formatdomain.html) is a good reference.

The next trick is to create/provide a Kickstart file to get these VM shells
actually working..!
