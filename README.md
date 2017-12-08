[![Build Status](https://travis-ci.org/alesium/ansible-net-ucarp.svg?branch=master)](https://travis-ci.org/alesium/ansible-net-ucarp)

net-ucarp
=========

Ansible Role to configure ucarp from pkgsrc

Requirements
------------

- Hosts requires pkgsrc's pkgin
- Hosts should be bootstrapped for ansible usage (have python,...)
- Root privileges, eg `become: yes`

Role Variables
--------------

TODO

Dependencies
------------

None

Example Playbook
----------------


    - hosts: servers
      roles:
         - { role: alesium.net-ucarp }

License
-------

BSD

Author Information
------------------

Sebastien Perreault <sperreault@alesium.net>
