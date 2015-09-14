#
# OS Detection
#

UNAME=`uname`

# Fallback info
DISTRO=''

CURRENT_OS='OS X'

# Use zsh-completions if it exists
if [[ -d "/usr/local/share/zsh-completions" ]]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

#
# Load Antigen
#
source ~/.antigen.zsh

#
# Load various lib files
#
antigen bundle robbyrussell/oh-my-zsh lib/

#
# Load Theme
#
antigen theme agnoster

#
# Antigen Bundles
#

antigen bundle autojump
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle copydir
antigen bundle copyfile
antigen bundle cp
antigen bundle docker
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
antigen bundle gnu-utils
antigen bundle rbenv
antigen bundle rsync
antigen bundle rupa/z
antigen bundle screen
antigen bundle sudo
antigen bundle Tarrasch/zsh-autoenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Node Plugins
antigen bundle coffee
antigen bundle node
antigen bundle npm

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

antigen bundle vagrant
antigen bundle brew
antigen bundle brew-cask
antigen bundle gem
antigen bundle osx
antigen bundle rbenv

antigen apply

#
# Load dotfiles
#

source ~/.fresh/build/shell.sh

#
# Load rbenv
#

if which rbenv > /dev/null; then
	eval "$(rbenv init -)";
fi
