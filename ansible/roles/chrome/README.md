# Chrome

This role installs the Chrome browser and also adds it to the pinned bar.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: chrome
```

## Configuration

This role has no configuration options.