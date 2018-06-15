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
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```
    - hosts: servers
      become: true

      roles:
         - ansible-rhsm
```

Example custom_vars.yml file
-------
NOTE:  rhsm_activation + rhsm_org_id is mutually exclusive of rhsm_user + rhsm_password
```
---
rhsm_activation_key: my_activation_key
rhsm_org_id: 1234567
rhsm_pool: 028390438209823048239
rhsm_user:
rhsm_password:
```

License
-------

BSD

Author Information
------------------
Bill Hirsch

github: bhirsch70

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
