# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/martin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"


# Case insensitive auto completion
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh

## User configuration ##

# Spotify
if ! pgrep -x spotifyd > /dev/null; then
    spotifyd
fi

# Some funky github ssh stuff:

# Check if ssh-agent is running, if not, dew it
#if [ -z "$(pgrep ssh-agent)" ]; then
#    eval "$(ssh-agent -s)" > /dev/null 2>&1
#fi

# To see if ssh-agent is running already:
# ps aux | grep ssh # You can kill it if it is a problem

# ENV Variables
export CHROME_EXECUTABLE="/usr/bin/brave"
export GTK_IM_MODUlE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export JAVA_HOME="/usr/lib/jvm/java-22-openjdk"
export CS111="/home/martin/Documents/School/Winter 2024/CS 111/CS111-repo/"

# espup exports
export LIBCLANG_PATH="/home/martin/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-16.0.4-20231113/esp-clang/lib"
export PATH="/home/martin/.rustup/toolchains/esp/xtensa-esp-elf/esp-13.2.0_20230928/xtensa-esp-elf/bin:$PATH"

# Aliases
alias rustnew="cargo new --bin"
alias cleanup="yay -Rns $(pacman -Qdtq)"
alias config="git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
alias monitor="mons -e"
alias spt="spotifyd && spt"
alias todo="cat ~/Documents/TODO.txt"
CS111() {
    cd $CS111 
    source bin/activate
}

source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# PATH
export PATH="$PATH:/home/martin/.local/bin"
export PATH="$PATH:/opt/flutter/bin"
export PATH="$PATH:/opt/android/bin"
export PATH="$PATH:/opt/pulsar"
export PATH="$PATH:$HOME/.cargo/bin"

# Commands to run on init 
