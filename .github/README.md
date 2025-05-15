# dotfiles
My personal dotfiles, repo idea based off of: [https://stegosaurusdormant.com/bare-git-repo/](https://stegosaurusdormant.com/bare-git-repo/)

**Note**: this is a bare git repo. As such, traditional git commands will not work due to the repository being spread all over the home directory. For notes on performing commits and the like, see the section **`config` command**

## Setup
* Clone the repository (most anywhere will do, just make sure that HOME environment variable is set to your home folder)
* Navigte to `<repo root>/.config/dotfiles`
    + In here you will find a file named `setup.sh`, `chmod +x` that bad boy and run it
    + This should move all the dotfiles to their designated locations. If this doesn't work, please submit a pull request or send me an email
    + The actual `.git` folder will be located in `~/.config/dotfiles`
* Make sure to edit your upstream repository if you want to copy these to your own Github account
* TODO: make script install prerequisite packages

## `config` command
Make sure the following is in your favorite rc file (`.bashrc`, `.zshrc`, etc.):

`alias config='git --git-dir=<path to git folder> --work-tree=$HOME'`

In my case, my git folder is `~/.config/doftiles`.

This should already be included in my `.bashrc` and `.zshrc`. You can change the command to be anything you want, you don't have to use `config`.

Now, whenever you want to make a change to your dotfiles, use `config` instead of `git` for any git command.

I also recommend adding an `[alias]` to make adding all files with changes (that are also being tracked) easier. This should already be included in the `~/.config/dotfiles/config` file. If not, here is how you can add this to the config file in the `dotfiles` directory: `addtracked = !git add $(git ls-files)`.

It can be a headache when you use `git add .` by accident as this will add the entire directory to the staging area so, this is highly recommended. To add all tracked files, use `config addtracked`. This will prevent git from adding any untracked files.

## Syncthing
I highly recommend using syncthing if you want to sync files between devices. [Check out this video for help](https://www.youtube.com/watch?v=PSx-BkMOPF4)
