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
#antigen theme agnoster
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

#
# Antigen Bundles
#

antigen bundle docker
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
antigen bundle Tarrasch/zsh-autoenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Node Plugins
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
