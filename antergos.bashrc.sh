#nobodyzxc profile for antergos
shopt -s no_empty_cmd_completion

umask 002
set nu
export USERNAME=`/usr/bin/whoami`

shopt -s nocaseglob #no identity up or low case

export TERM=xterm
export PS2="cont> "
export PATH=$PATH:/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/bin:~/bin:~/.local/bin:/usr/lib/jvm/java-9-openjdk/bin:/home/zxc/.yarn/bin
export CPATH="$HOME/lib"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib

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
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \[\e[33m\]%\j \`if [ \$? = 0 ]; then echo \[\e[34m\]\$\[\e[0m\]; else echo \[\e[31m\]!\[\e[0m\]; fi\` "

if [ $? == 0 ];then echo "done"; else echo "failed"; fi

#echo -ne "TheFuck setting \t... "
#eval "$(thefuck --alias)"
#if [ $? == 0 ];then echo "done"; else echo "failed"; fi

#echo -ne "Setting AutoJump \t... "
#[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
#if [ $? == 0 ];then echo "done"; else echo "failed"; fi

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
alias ducks='du -ksm * |sort -rn |head -20'

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
alias chrome='google-chrome-stable'
alias g='chrome>/dev/null 2>&1 &'
alias cof='__(){ for f in $*; do chrome "$f" 2>/dev/null ; done };__'
alias dbug='_(){ chrome https://www.udebug.com/UVa/$2; };_'
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
alias exp='_(){ explorer `cygpath -w "$PWD"`; };_' #\\$1
alias outt='rm -f /etc/totalExit && exit'
alias open='xdg-open'
alias pm='ps -efu `whoami`'
alias g++='g++ -Wall'
alias gcc='gcc -Wall'
alias sss='_(){ hexo clean && hexo g && hexo s -p 8080; };_'
alias ddd='_(){ hexo clean && hexo g && hexo d && echo -e "a\n*\nq\n"| git add -i && git add -u && git commit -m "backup" && git pm; };_'
alias ssd='hexo s --draft -p 8080'
alias bc='bc -l'
alias findext='_(){ find . -regex ".*\.\($1\)"; };_'
if [ $? == 0 ];then echo "done"; else echo "failed"; fi
# sudo taskmgr
# cyg-get
alias respace='for f in *\ *; do mv "$f" "${f// /_}"; done'
alias ..='cd ..'
#alias lh='_(){ if [ $# -eq 0 ];then w3m http://localhost:8080; else w3m http://localhost:8080/$* };_'