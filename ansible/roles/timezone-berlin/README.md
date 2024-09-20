# Timezone Berlin

This role sets the time zone used in the Krec-Box to Berlin.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: timezone-berlin
```

## Configuration

In the main.yml under the defaults directory, the time zone can be set to a time zone other than Berlin.