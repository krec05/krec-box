#!/usr/bin/bash
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'intellij-idea-community_intellij-idea-community.desktop']"
