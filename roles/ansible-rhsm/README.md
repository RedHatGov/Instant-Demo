Role Name
=========

ansible-rhsm

This role will register a VM to the Red Hat portal

Requirements
------------

* Create a custom variables file

Role Variables
--------------

* All variables to be defined in your own custom extra variables file and/or AWX / Tower survey

```
---
rhsm_activation_key
rhsm_org_id
rhsm_pool
rhsm_user
rhsm_password
product
```

Example custom_vars.yml file
----------------------------
NOTE:  rhsm_activation + rhsm_org_id is mutually exclusive of rhsm_user + rhsm_password
```
---
rhsm_activation_key: my_activation_key
rhsm_org_id: 1234567
rhsm_pool: 028390438209823048239
rhsm_user:
rhsm_password:
# Define category of repos you want to enable.  Valid values include:
# rhel, ocp, satellite, cfme, gluster.  (rhel will also be included)
product: gluster
```
Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```
    - hosts: servers
      become: true

      roles:
         - ansible-rhsm
```

License
-------

BSD

Author Information
------------------
Bill Hirsch

github: bhirsch70

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
