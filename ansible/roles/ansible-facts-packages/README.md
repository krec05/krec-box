# Ansible Facts Packages

This role is used to collect the packages that have already been installed. This means that it is not necessary to check
whether these packages are already installed or not during the installation; the information is already available in the
fact.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: ansible-facts-packages
```

## Configuration

This role has no configuration options.