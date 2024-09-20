# Disable lock screen

This role switches off the automatic logout after a certain period of inactivity. However, the effect only takes effect
after a restart when the role is installed for the first time.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: disable-lock-screen
```

## Configuration

This role has no configuration options.