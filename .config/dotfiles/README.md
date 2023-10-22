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
