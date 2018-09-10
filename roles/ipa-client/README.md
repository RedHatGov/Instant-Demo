ipa-client
=========

This role will install and configure the ipa-client against a pre-existing idM server

Requirements
------------

Only tested on Red Hat Enterprise Linux, although with minor modifications, would likely work across other distros.

Role Variables
--------------
All role variables need to be defined in a custom vars file you create as each value is specific to your environment.
You can then pass your custom vars file as `--extra-vars` on the command line.
To stay secure, use `ansible-vault` to encrypt your `ipa_password`

|variable|description|example|
|--------|-----------|-------|
|ipa_server:|fqdn of your idM/IPA server| ipa-server.bhirsch.io|
|ipa_server_ip:|IP of your idM/IPA server| 192.168.100.254|
|ipa_domain:|Your domain| example.io|
|ipa_principal:|idM account enabled for adminstrative rights| admin|
|ipa_passwd:|ipa_principal password| some encrypted string |


Dependencies
------------

none

Example Playbook
----------------

```
- name: Install and configure ipa-client
  hosts: ipaclients
  become: true

  roles:
    - ipa-client
```
Example Use
----------------

`ansible-playbook my-ipa-playbook.yml -e @my-variables-file.yml --ask-vault-pass`

License
-------

BSD

Author Information
------------------

- Bill Hirsch
- github user: bhirsch70
- bhirsch@redhat.com
