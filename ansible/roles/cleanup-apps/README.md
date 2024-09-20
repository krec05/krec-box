# Cleanup Apps

This role uninstalls all unwanted apps. Depending on the configuration, these apps are removed from the package
management apt or snap.

## Dependencies

This role is dependent on the ansible-facts-packages role.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: cleanup-apps
```

## Configuration

In the main.yml under the defaults directory, you can list the programs that you want to uninstall using either apt or
snap.