# dotfiles

This is simply a dump of my config files that make my personal systems behave as I want them to. The dotfiles are managed by [dotbot](https://github.com/anishathalye/dotbot) because I don't realy have the time or patience to flesh out my own script to send these files where they need to go.

The repo is currently a work-in-progress and I expect it will remain so for a long, long time. I install it as follows:
1. Clone the repo to `~/.dotfiles`.
2. `cd ~/.dotfiles`.
3. `./install`.

However, this will break the system in inexplicable ways if followed blindly. I suggest reading through the dotbot [configuration](https://github.com/anishathalye/dotbot#configuration) and tweaking the `install.config.yaml` before executing `./install`. In fact, it is best if only the config files needed are manually copied to their correct location and edited as needed. This will be ideal for anyone who isn't me.

Like the repo, this README will also be regularly updated (I hope). What follows is a brief overview of my system and the applications I use as well as a to-do list on how to improve the system or dotfile management.

## The system

The OS is GNU/Linux with the [Arch linux](https://www.archlinux.org/) distribution. The window manager (WM) is [bspwm](https://github.com/baskerville/bspwm/) working in conjunction with [sxhkd](https://github.com/baskerville/sxhkd/) for keyboard shortcuts. Their configs are found in `env/`.

## To do
* Update README.
* Branch for multi-monitor non-HiDPI workstation.
* Branch for non-HiDPI second laptop.
* Ensure syncing between these branches with minimal conflict.
