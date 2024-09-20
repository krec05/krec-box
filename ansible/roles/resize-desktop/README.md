# Resize Desktop

With this role, the desktop resolution used can be set to 1920x1080, whereby the refresh rate is set to 59,998. However,
the effect only takes effect after a restart when the role is installed for the first time.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: resize-desktop
```

## Configuration

In the main.yml file in the defaults directory, the resolution can be set to a value other than 1920x1080 with a refresh
rate of 59,998.