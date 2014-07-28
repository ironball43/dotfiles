# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
vim74_home='/usr/local/vim74/bin'
for vim74_cmd in `ls ${vim74_home}`; do
  alias ${vim74_cmd}="${vim74_home}/${vim74_cmd}"
done
alias vi='vim'
