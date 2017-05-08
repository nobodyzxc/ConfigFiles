#nobodyzxc profile for cygwin
shopt -s no_empty_cmd_completion

umask 002
set nu
export USERNAME=`/usr/bin/whoami`

#export LANG="zh_TW.UTF-8"
#export LC_CTYPE="zh_TW.UTF-8"
#export LC_NUMERIC="zh_TW.UTF-8"
#export LC_TIME="zh_TW.UTF-8"
#export LC_COLLATE="zh_TW.UTF-8"
#export LC_MONETARY="zh_TW.UTF-8"
#export LC_MESSAGES="zh_TW.UTF-8"
#export LC_ALL="zh_TW.UTF-8"

echo "chcp 65001" | cmd >/dev/null
# set utf-8 for windows cygwin - into cmd

shopt -s nocaseglob #no identity up or low case

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export TERM=xterm
export PS2="cont> "
export PATH=$PATH:/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/bin:~/bin:~/.local/bin
export CPATH="$HOME/lib"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
#    `/bin/ls -d /cygdrive/c/Program\ Files/*` \
#    `/bin/ls -d /cygdrive/c/Program\ Files\ \(x86\)/*`
echo "EnvPath..."
for _bin in `/bin/ls -d ~/bin/*_bin`
do
    printf "\t%q\n" ${_bin##*/}
    PATH=$PATH:`printf "%q" $_bin`
done
IFS=$SAVEIFS

echo -e "\t\t\t... done"

export EDITOR=vim
#export TMOUT=1800

#[[ "$PS1" ]] && /usr/games/fortune | /usr/games/cowsay -n
#show cowsay when you open terminal


echo -ne "Setting Pormpt \t\t... "

# ASCII
#PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]me@\l\[\033[01;34m\] \W \[\e[33m\]%\j \`if [ \$? = 0 ]; then echo \[\e[34m\]\$\[\e[0m\]; else echo \[\e[31m\]!\[\e[0m\]; fi\` "

# UNICODE
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
        echo -e "${GRNBG:2:16}${BLKFG:2:12} \$ ${BLKBG:2:7}${GRNFG:2:8}"
    else
        echo -e "${YELBG:2:8}${BLKFG:2:12} ${REDFG:2:8}! ${BLKBG:2:7}${YELFG:2:8}"
    fi
}
FENCY="${LGRNFG}me@\l ${BLUBG}${BLKFG}${WHIFG} \W ${BLKBG}${BLUFG} ${YELFG}%\j \`psstat\` ${BLKBG}"
PS1=$FENCY

if [ $? == 0 ];then echo "done"; else echo "failed"; fi

#for ttyi in 1 2 3 4
#	do
#		if [ "$(tty)" = "/dev/tty$ttyi" ]; then
#			export LC_ALL="en_US.UTF-8"
#			export LANGUAGE="en_US.UTF-8"
#			export LANG="en_US.UTF-8"
#		fi
#	done

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
alias v='vim -u /cygdrive/d/workSpace/github/MyConfFiles/oj.vim'

alias e='emacs'

alias irssi='env TERM=xterm-color irssi'
alias ducks='du -ks * |sort -rn |head -20'

alias rm='rm -i'
alias vb='vim ~/.bashrc'
# 'gf' in vim to open a filename
alias vc='vim ~/.vimrc'
alias sb='source ~/.bashrc'
alias cn='cat ~/bin/note.txt'
alias to='. ~/bin/to'
alias note='_(){ echo $1 >> note.txt; }; _'

alias mcd='_(){ mkdir -m 715 $1 ; cd $1 ; } ; _'
alias l='clear'
alias ll='ls -la'
alias la='ls -a'
alias tm='tmux'
alias python='python3'
alias py='python3'
alias py2='python2'
PYW='/cygdrive/c/Users/dici8/AppData/Local/Programs/Python/Python36-32/python.exe'
alias pyw='_(){ if [ -z "$1" ];then echo "pls give a gui prog of python"; else $PYW $1; fi; };_'

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
alias inst='~/download/setup-x86_64'
alias g='chrome.exe 2>/dev/null 1>/dev/null &'
alias ppt='_(){ ksolaunch.exe  /wpp /w /fromksolaunch `cygpath -w "$PWD"`\\$1; };_'
alias word='_(){ ksolaunch.exe /wps /w /fromksolaunch `cygpath -w "$PWD"`\\$1; };_'
alias exp='_(){ explorer `cygpath -w "$PWD"`\\$1; };_'
alias pp='_(){ PS1="$1"; };_'
alias outt='rm -f /etc/totalExit && exit'
alias xlat='_(){ chrome https://translate.google.com.tw/?hl=zh-TW#en/zh-TW/$1; };_'
alias ghci='rlwrap ~/bin/haskell_bin/ghcii.sh'
alias rkt='rlwrap racket3m.exe'
alias biwas='rlwrap ~/npm/node_modules/.bin/biwas'
alias rp='racket3m.exe <'
alias mingcc='x86_64-w64-mingw32-gcc.exe -static -lopengl32 -lgdi32 -lglu32 -mwindows'
alias ming++='x86_64-w64-mingw32-g++.exe -static -lopengl32 -lgdi32 -lglu32 -mwindows'
alias cgp='~/bin/MinGW64/x86_64-w64-mingw32-c++.exe -static -lopengl32 -lgdi32 -lglu32'
alias pm='ps -efu `whoami`'
alias open='cygstart'
alias w='echo "only you"'
#alias j='_(){ cd `autojump $*`; };_'
alias g++='g++ -Wall'
alias gcc='gcc -Wall'
alias sss='_(){ hexo clean && hexo g && hexo s -p 8080; };_'
alias ddd='_(){ hexo clean && hexo g && hexo d && echo -e "a\n*\nq\n"| git add -i && git add -u && git commit -m "backup" && git pm; };_'
alias ssd='hexo s --draft -p 8080'
alias line='cd ~/desktop && echo "line.lnk" | cmd && cd -'
alias uc='rm -rf a.exe *.in *.out in* out* && clean'
alias db='mysql -u root -p'
alias dbstart='/usr/bin/mysqld_safe --datadir="/var/lib/mysql" &'
alias dbshutdown='/usr/bin/mysqladmin -u root shutdown'
alias tp='_(){ cp ~/oj/template.cc ./$1.cc; };_'
alias mk='landslide make.cfg'
alias soft='control.exe appwiz.cpl'
alias sudo='cygstart --action=runas'
alias kl='_(){ pm | grep $1 | getcol 1; };_'
alias bc='bc -l'
if [ $? == 0 ];then echo "done"; else echo "failed"; fi
# sudo taskmgr
# cyg-get
alias catch='_(){ scp -r s10410@cherry.cs.nccu.edu.tw:/tmp/$1 .; };_'
alias share='_(){ scp -r $@ s10410@cherry.cs.nccu.edu.tw:/tmp; };_'
alias wipe='_(){  ssh s10410@cherry.cs.nccu.edu.tw rm -ir /tmp/$1; };_'
alias node='rlwrap node -i'
alias post='j post'
alias cpath='_(){ cygpath $1 `pwd` | putclip -d; };_' #cygutils-extra needed
alias apt-get='apt-cyg'
alias cpf='_(){ cat $1 | putclip; };_'

#alias cat="_(){  cat \$@; echo \"I'm  ok.\"; };_"
POWERLINE_SCRIPT=/usr/share/powerline/bindings/bash/powerline.sh
if [ -f $POWERLINE_SCRIPT ]; then
  source $POWERLINE_SCRIPT
fi
