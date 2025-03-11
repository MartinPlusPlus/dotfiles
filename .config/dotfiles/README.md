# dotfiles
My personal dotfiles, repo idea based off of: https://stegosaurusdormant.com/bare-git-repo/

## NOTES
This is a bare git repo. To update, use the 'config' command with any git command

## Cloning
* Be sure to clone this repo using `git clone --bare` with the repo url
    * This will make sure it is a 'bare' repository and enable the `config` command functionality
* Move the contents of the repo to ~/.config/dotfiles (this is where my zshrc will look)

## Prereqs
Note: I haven't finished making this list yet, hold tight
    - I might add a script to install these automatically
* zsh
* nvm
* neovim
* spotifyd
* i3
* notify-osd
* polybar
* qtile
* brightnessctl
  - python3

Note: to install packages from a file in arch linux you can use the following command:
`sudo pacman -S --needed - < packages.txt`
You just need create a file names `packages.txt` and write package names in line-by-line

## 'config' command
* Make sure the following is in your favorite .rc:
    `alias config='git --git-dir=<path to git folder> --work-tree=$HOME'`
* Execute the following (after refreshing said .rc)
    `config config --local status.showUntrackedFiles no`

This should allow you to use the `config` command
* I recommend adding an `[alias]` to make adding all change files (that are also being tracked) easier.
    * Add this to the config file in the `dotfiles` directory: `addtracked = !git add $(git ls-files)`
    * It can be a headache when you use `git add .` by accident so, this is highly recommended
    * To add all tracked files, use `config addtracked`. This will prevent git from adding any untracked files (as opposed to using `config add .`)

## Syncthing
I highly recommend using syncthing if you want to sync files between devices. [Checkout this video for help](https://www.youtube.com/watch?v=PSx-BkMOPF4)
