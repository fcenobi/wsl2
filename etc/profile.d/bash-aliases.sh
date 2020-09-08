alias psfind='ps aux | grep -i '
alias findf='find . -type f -name '
alias ffind='find . -type f -ls  '
alias ls='/bin/ls --color=auto'
alias la='/bin/ls --color=auto -A'
alias l='/bin/ls --color=auto -CF'
alias l.='/bin/ls -d .* --color=auto'
alias ll='/bin/ls --color=auto -alFhtr'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cp-f='cp -i'
alias mv-f='mv -i'
alias rm-f='rm -i'


alias sdisable='systemctl disable '
alias senable='systemctl enable '
alias srestart='systemctl restart '
alias sstatus='systemctl status '
alias sstop='systemctl stop '
alias sstart='systemctl start '

alias asearch='apt-cache search '
alias ainstall='apt-get install  -y '
alias aremove='apt-get remove -y '
alias aupdate='apt-get upgrade '
alias ainstall-norecomend='apt-get -y -o APT::Install-Recommends=false -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install '
alias stnode='pm2 start --max-memory-restart 500M  '

alias gclone='git clone '
alias fcclone="git clone https://github.com/fcenobi/$1.git"
#alias gs='git-status'
#alias gd='git-diff'
#alias ga='git-add'
#alias gb='git-branch'
#alias gc='git-commit'
#alias gca='git-commit -v -a'
#alias gcam='git-commit --amend -v'
#alias gl='git-log'
#alias gll="git-log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias penv-reload="source $PENV_PATH"

#alias dnf-install='dnf install -y '
#alias dnf-search='dnf search '
alias catalina_base='cd $CATALINA_BASE'
alias catalina_home='cd $CATALINA_HOME'
#alias lst1='/bin/ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
#alias lst='/bin/ls -R | grep ":$" | sed -e '"'"'s/:$//'"'"' -e '"'"'s/[^-][^\/]*\//--/g'"'"' -e '"'"'s/^/   /'"'"' -e '"'"'s/-/|/'"'"
#alias llmod="ls -al|awk '{k=0;s=0;for(i=0;i<=8;i++){;k+=((substr(\$1,i+2,1)~/[rwxst]/)*2^(8-i));};j=4;for(i=4;i<=10;i+=3){;s+=((substr(\$1,i,1)~/[stST]/)*j);j/=2;};if(k){;printf(\"%0o%0o \",s,k);};print;}'" 
#alias filetree='find | sed '\''s|[^/]*/|- |g'\'''
#alias filetree1="find | sed 's|[^/]*/|- |g'"
#alias dirtree='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias apachestatus='apache2ctl -SMt -D DUMP_INCLUDES '
alias lspath='sed 's/:/\n/g' <<< "$PATH"'
#alias updatealiases='curl -s $ALIAS_PATH > ~/.bash_aliases && chmod +777  ~/.bash_aliases '


#export FCGITBASE="https://github.com/fcenobi/"
#export FCRAWBASE="https://raw.githubusercontent.com/fcenobi/"
#export ALIAS_PATH="https://raw.githubusercontent.com/fcenobi/script/master/alias"
#alias updatprofiled='curl -s $ALIAS_PATH > /etc/profile.d/aliases.sh && chmod +777 /etc/profile.d/aliases.sh '
#alias updatealias='/bin/bash < <(curl -s $ALIAS_PATH) '


alias wanip='curl https://ipecho.net/plain ; echo'
 
 
 
