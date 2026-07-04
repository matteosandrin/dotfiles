export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git sublime)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

source $ZSH/oh-my-zsh.sh

alias claude="clear && claude --dangerously-skip-permissions"

# jump to Programming Projects folder
prp(){

	if [ -z $1 ]; then
		cd ~/Projects/
	else
		cd ~/Projects/$1
	fi
}

# override cd to automatically enter virtualenvs matching the current directory
# it also exits the virtualenv automatically as soon as you exit the directory
function cd {
    builtin cd "$@"

    # the path is not the root of the filesystem
    if [[ ${PWD} != "/" ]] ; then

    	# the current directory is also the name of a virtualenv
	    if [[ $(lsvirtualenv -b | grep ${PWD##*/}) = ${PWD##*/} ]] ; then 

	    	# the virtualenv in question is not already activated
	    	if [[ ${VIRTUAL_ENV##*/} != ${PWD##*/} ]] ; then 
	        	workon ${PWD##*/}
	        fi
	    fi
	fi

	# the folder of the virtualenv is not in the current path (e.g. we are not in that directory or any of its children)
    if [[ ! -z ${VIRTUAL_ENV} ]] && [[ ! ${PWD} = *${VIRTUAL_ENV##*/}* ]] ; then
    	deactivate
   	fi

}

precmd () {
	print -Pn "\e]0;%~\a"
}

# Exports
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export FLASK_DEBUG=1
export FLASK_APP=app.py
export TERM=xterm-256color
export HOMEBREW_NO_AUTO_UPDATE=1

# Load config specific to this machine (installed tooling, hardcoded paths),
# guarded by hostname so the portable config above stays machine-agnostic.
if [[ "$(hostname -s)" == "Matteos-MacBook-Pro" ]]; then
	source "$HOME/.zshrc.Matteos-MacBook-Pro"
fi
