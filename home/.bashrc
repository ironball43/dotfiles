# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Use vim 7.4 command if installed vim 7.4.
vim74_home='/usr/local/vim74/bin'
if [ -e ${vim74_home} ]; then
	for vim74_cmd in `ls ${vim74_home}`; do
		alias ${vim74_cmd}="${vim74_home}/${vim74_cmd}"
	done
fi
alias vi='vim'
