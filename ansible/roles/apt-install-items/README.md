# Apt Install Items

This role is used to install packages via the package management apt.

## Dependencies

This role is dependent on the ansible-facts-packages role.

## Usage

The packages to be installed are specified in the playbook.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: apt-install-items
      packages:
        - git
        - unzip
        - curl
        - default-jdk
```

## Configuration

This role has no configuration options.