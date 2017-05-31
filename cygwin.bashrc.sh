#nobodyzxc profile for cygwin
shopt -s no_empty_cmd_completion

umask 002
set nu
export USERNAME=`/usr/bin/whoami`

echo "chcp 65001" | cmd >/dev/null
# set utf-8 for windows cygwin - into cmd

shopt -s nocaseglob #no identity up or low case

export TERM=xterm
export PS2="cont> "
export PATH=$PATH:/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/bin:~/bin:~/.local/bin
export CPATH="$HOME/lib"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
echo "EnvPath..."
for _bin in ~/bin/*_bin
do
    [ -e "$_bin" ] && \
        printf "\t%q\n" ${_bin##*/} && \
        PATH=$PATH:`printf "%q" $_bin` \
        || echo "There's no *_bin in your bin dir"
done
IFS=$SAVEIFS

echo -e "\t\t\t... done"

export EDITOR=vim

#[[ "$PS1" ]] && /usr/games/fortune | /usr/games/cowsay -n
#show cowsay when you open terminal

echo -ne "Setting Pormpt \t\t... "

# ASCII
#PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]me@\l\[\033[01;34m\] \W \[\e[33m\]%\j \`if [ \$? = 0 ]; then echo \[\e[34m\]\$\[\e[0m\]; else echo \[\e[31m\]!\[\e[0m\]; fi\` "

# UNICODE
# echo treat \x01 \x02 as \[ \] in ps
# They are called NON-PRINT CHARACTERS
NPB="\x01"
NPE="\x02"

LGRNFG="\[\033[01;32m\]"
BLKFG="\[\033[38;5;0m\]"
BLKBG="\[\033[0m\]"
WHIFG="\[\033[39m\]"
BLUFG="\[\033[34m\]"
BLUBG="\[\033[44m\]"
YELFG="\[\033[33m\]"
YELBG="\[\033[43m\]"
GRNBG="\[\033[30;48;5;82m\]"
GRNFG="\[\033[32m\]"
REDFG="\[\033[31m\]"

psstat() {
    if [ $? = 0 ];then
        echo -e "${NPB}${GRNBG:2:16}${BLKFG:2:12}${NPE} \$ ${NPB}${BLKBG:2:7}${GRNFG:2:8}${NPE}"
    else
        echo -e "${NPB}${YELBG:2:8}${BLKFG:2:12}${NPE} ${NPB}${REDFG:2:8}${NPE}! ${NPB}${BLKBG:2:7}${YELFG:2:8}${NPE}"
    fi
}

PS1="${LGRNFG}me@\l ${BLUBG}${BLKFG}${WHIFG} \W ${BLKBG}${BLUFG} ${YELFG}%\j \`psstat\` ${BLKBG}"

if [ $? == 0 ];then echo "done"; else echo "failed"; fi

#echo -ne "TheFuck setting \t... "
#eval "$(thefuck --alias)"
#if [ $? == 0 ];then echo "done"; else echo "failed"; fi

echo -ne "Setting AutoJump \t... "
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
if [ $? == 0 ];then echo "done"; else echo "failed"; fi

echo -ne "Sourcing EnvVars\t... "
if [ -f ~/bin/EnvVars.sh ];then
    source ~/bin/EnvVars.sh
fi
if [ $? == 0 ];then echo "done"; else echo "failed"; fi

echo -ne "Aliasing \t\t... "
# Set alias forms
alias ls='/bin/ls -NF --color=auto'
alias sl='ls'
alias vim='env TERM=xterm-color vim'
alias e='emacs'
alias irssi='env TERM=xterm-color irssi'
alias ducks='du -ks * |sort -rn |head -20'

alias rm='rm -i'
alias vb='vim ~/.bashrc'
# 'gf' in vim to open a filename
alias vc='vim ~/.vimrc'
alias sb='source ~/.bashrc'
alias mcd='_(){ mkdir -m 715 $1 ; cd $1 ; } ; _'
alias l='clear'
alias ll='ls -la'
alias la='ls -a'
alias tm='tmux'
alias python='python3'
alias py='python3'
alias py2='python2'
alias cof='_(){ (chrome `cygpath -w "$PWD"`\\$1) 1>/dev/null 2>/dev/null & };_'
alias dbug='_(){ chrome https://www.udebug.com/UVa/$1; };_'
alias qsub='chrome https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=25'
swpclean() {
    if [ -f .*.swp ];then
        for fn in `/bin/ls .*.swp`
        do
            /bin/rm -i $fn
        done
    fi
}
alias clean='_(){ /bin/rm -f *.stackdump *.o *.core 2>/dev/null ; swpclean;};_'
alias g='chrome.exe 2>/dev/null 1>/dev/null &'
alias exp='_(){ explorer `cygpath -w "$PWD"`; };_' #\\$1
alias outt='rm -f /etc/totalExit && exit'
alias pm='ps -efu `whoami`'
alias open='cygstart'
alias g++='g++ -Wall'
alias gcc='gcc -Wall'
alias sss='_(){ hexo clean && hexo g && hexo s -p 8080; };_'
alias ddd='_(){ hexo clean && hexo g && hexo d && echo -e "a\n*\nq\n"| git add -i && git add -u && git commit -m "backup" && git pm; };_'
alias ssd='hexo s --draft -p 8080'
alias uc='rm -rf a.exe *.in *.out in* out* *.class && clean'
alias db='mysql -u root -p'
alias dbstart='/usr/bin/mysqld_safe --datadir="/var/lib/mysql" &'
alias dbshutdown='/usr/bin/mysqladmin -u root shutdown'
alias soft='control.exe appwiz.cpl'
alias sudo='cygstart --action=runas'
alias bc='bc -l'
if [ $? == 0 ];then echo "done"; else echo "failed"; fi
# sudo taskmgr
# cyg-get
alias node='rlwrap node -i'
alias apt-get='apt-cyg'
alias cpath='_(){ cygpath $1 `pwd` | putclip -d; };_' #cygutils-extra needed
alias cpf='_(){ cat $1 | putclip; };_'
alias mail='_(){ chrome https://mail.google.com/mail/u/$1/#inbox; };_'
alias gcloud='gcloud.cmd'
alias asmgcc='i686-w64-mingw32-gcc.exe'
POWERLINE_SCRIPT=/usr/share/powerline/bindings/bash/powerline.sh
if [ -f $POWERLINE_SCRIPT ]; then source $POWERLINE_SCRIPT; fi
