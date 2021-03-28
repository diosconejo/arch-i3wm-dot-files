# arch-i3wm-dot-files
personal curated dot files directly uploaded from GNU stow directory

Applications currently started by xprofile, i3 config, and XDG autostart
Additionally, the following systemd services are run:
- geoclue-agent
User slice:
- redshift (Wants=geoclue-agent)
- emacs

Intended use:
- Maintain repo in a preserved home partition with stowed dot files
- git clone in a new system to get all config in one step
