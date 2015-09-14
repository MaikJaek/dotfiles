#
# OS Detection
#

UNAME=`uname`

# Fallback info
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
else
    # Must be Linux, determine distro
    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi
    fi
fi

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
antigen bundle sublime
antigen bundle sudo
antigen bundle Tarrasch/zsh-autoenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# For SSH, starting ssh-agent is annoying
antigen bundle ssh-agent

# Node Plugins
antigen bundle coffee
antigen bundle node
antigen bundle npm

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
	antigen bundle vagrant
	antigen bundle brew
	antigen bundle brew-cask
	antigen bundle gem
	antigen bundle osx
	antigen bundle rbenv
elif [[ $CURRENT_OS == 'Linux' ]]; then
	# None so far...
	if [[ $DISTRO == 'CentOS' ]]; then

	fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
fi

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