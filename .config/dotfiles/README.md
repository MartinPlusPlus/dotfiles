# dotfiles
My personal dotfiles, repo idea based off of: https://stegosaurusdormant.com/bare-git-repo/

## NOTES
This is a bare git repo. To update, use the 'config' command with any git command

## Cloning
* Be sure to clone this repo using `git clone --bare` with the repo url
    * This will make sure it is a 'bare' repository and enable the `config` command functionality
* Move the contents of the repo to ~/.config/dotfiles (this is where my zshrc will look)

## Setup 'config' command
* Make sure the following is in your favorite .rc:
    `alias config='git --git-dir=<path to git folder> --work-tree=$HOME'`
* Execute the following (after refreshing said .rc)
    `config config --local status.showUntrackedFiles no`

This should allow you to use the `config` command
