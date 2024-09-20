# Keyboard Layout DE

This role sets the keyboard configuration used in the Krec-Box to the German QWERTZ assignment.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: keyboard-layout-de
```

## Configuration

In the main.yml file, which is located in the defaults directory, the keyboard layout can be set to a layout other than
the German QWERTZ layout.