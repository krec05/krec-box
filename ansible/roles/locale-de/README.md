# Locale DE

This role sets the locale used in the Krec-Box to DE.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: locale-de
```

## Configuration

In the main.yml under the defaults directory, the locale can be set to a locale other than DE.