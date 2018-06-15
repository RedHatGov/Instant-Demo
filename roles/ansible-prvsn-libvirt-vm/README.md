Role Name
=========

ansible-prvsn-libvirt-vm

This role will provision a VM on your libvirt environment.  It leverages a supplied kickstart file as well as an extra variables file to be passed either on the command line or through a AWX and/or Tower survey.

Requirements
------------

* Create a custom variables file
* Customize the supplied `default.ks.j2` template to include your own specifications.
* Kickstart automatically adds the user account `<username>` to new VMs
* Modify the encrypted passwords in the kickstart template for the `root` and `username` accounts. (See password encryption example in this README)
* Download ISO media for the base image

Role Variables
--------------

* All variables to be defined in your own custom extra variables file and/or AWX / Tower survey

* `default/main.yml` contains sample variables
* All variables are based on options to the `virt-install` command

```guest:
  - name: <name of your virtual machine>
    username: <account you want added to new vm>
    cpu: <# of cpus>
    mem: <amount of memory>
    iso: <path to downloaded iso>
    os:
      type: <type of OS>, e.g. Linux
      variant: <variant of OS>, e.g. rhel7
    disk:
      size: <size of OS disk>
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: localhost
      connection: local
      remote_user: ansibleops
      become: true

      roles:
         - ansible-prvsn-libvirt-vm

Password Encryption Example
---------------------------
```
# python -c 'import crypt,getpass;pw=getpass.getpass();print(crypt.crypt(pw) if (pw==getpass.getpass("Confirm: ")) else exit())'
```


License
-------

BSD

Author Information
------------------
Bill Hirsch

github: bhirsch70

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
