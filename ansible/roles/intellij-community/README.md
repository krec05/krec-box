# IntelliJ Community

This role is used to install the community version of IntelliJ and keep it up to date. The package management snap is
used for this purpose. In addition, IntelliJ is added to the pinned bar and also provided with a set of settings.

## Usage

The role is simply listed in the playbook, see code example.

```yaml
---
- hosts: localhost
  connection: local
  strategy: debug

  roles:
    - role: intellij-community
```

## Configuration

The IntelliJ installation directories are stored in the main.yml file in the defaults directory. For example, where the
plugins are saved or the settings. The plugins that are to be installed can also be listed in the file, whereby these
require the pluginId and the name of the directory under which they are installed in the plugin directory. The code
example shows the Ansible plugin.

```yaml
intellij_idea_plugins:
  - { plugin_id: ir.msdehghan.plugins.ansible, plugin_dir: AnsiblePlugin }
```

The zip file settings.zip is located in the files directory. This contains the settings for IntelliJ. If other settings
are required, this file must be adapted.