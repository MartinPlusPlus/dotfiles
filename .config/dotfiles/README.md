# dotfiles
My personal dotfiles

## NOTES
This is a bare git repo. To update, use the 'config' command with any git command

## Setup 'config' command
* Make sure the following is in your favorite .rc:
    `alias config='git --git-dir=<path to git folder> --work-tree=$HOME'`
* Execute the following (after refreshing said .rc)
    `config config --local status.showUntrackedFiles no`

This should allow you to use the `config` command

## Syncthing
I highly recommend using syncthing if you want to sync files between devices. [Checkout this video for help](https://www.youtube.com/watch?v=PSx-BkMOPF4)
