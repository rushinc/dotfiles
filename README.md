# dotfiles

This is simply a dump of my config files that make my systems behave the way I want them to. The dotfiles are managed by [dotbot](https://github.com/anishathalye/dotbot) because I don't realy have the time or patience to flesh out my own script to send these files where they need to go.

## Installation

Dotbot makes the installation process pretty simple.
1. Clone the repo to `~/.dotfiles`.
2. `cd ~/.dotfiles`.
3. `./install`.

## The system

The OS is GNU/Linux with the [Arch linux](https://www.archlinux.org/) distribution. I found that once familiar with Linux as an OS and after getting comfortable with tweaking random text files to control the computer Arch is designed to not get in your way. 

The window manager (WM) I use is [bspwm](https://github.com/baskerville/bspwm/) working in conjunction with [sxhkd](https://github.com/baskerville/sxhkd/) for keyboard shortcuts. Their configs are found in `env/`. I migrated to tiling WMs mainly because of the ease in managing a large number of workspaces and monitors. I have 13 workspaces declared and it isn't uncommon for me to have 10 of those actively occupied. Also, my work station has three monitors and sxhkd lets me move windows between them effortlessly.

A slightly more complicated set up is that of my music environment. Keeping in line with a keyboard oriented usage of my desktop environment, ncmpcpp fits in really nicely as the audio frontend. More crucial however is the mopidy and mpd supported backend which lets me stream my saved playlists from Spotify and adds their entire database in the search path.
