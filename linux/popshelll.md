## Popshell

This is a tiling window extension for GNOME >= 3.36.

Remove the "Activities Overview" shortcut:
```
# Get the current shortcut
$ gsettings get org.gnome.mutter overlay-key

# Set (remove) the shortcut
$ gsettings set org.gnome.mutter overlay-key ''
```

Also have installed `system-monitor-next`:
https://extensions.gnome.org/extension/3010/system-monitor-next/
