# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias nexus="cd /opt/nexus"
alias pyenv="source /home/roman/API/.venv/bin/activate"
alias home="cd /home/roman.gon"
alias dcd="cd /opt/nexus && docker-compose down && cd -"
alias dcu="cd /opt/nexus && docker-compose up -d && cd -"
alias dvl="docker volume list"
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
