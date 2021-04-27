sf="~/public_html/share"
cherry="s10410@cherry.cs.nccu.edu.tw"
share="${cherry}:$sf"
alias report='xradnr --output eDPI --mode 1366x768'
alias ws='wc -m'
alias g='chromium>/dev/null 2>&1 &'

alias share='__(){ if [ $# -gt 1 ];then scp -r $1 ${share}/$2; ssh $cherry chmod 644 ${sf}/$2;else scp -r $1 ${share}; ssh $cherry chmod 644 ${sf}/$1;fi; } ; __'
alias fetch='__(){ for fn in $*;do scp ${share}/$fn .;done; } ; __'
alias ls='/bin/ls -NF --color=auto'
alias sl='ls'
alias vim='env TERM=xterm-color vim'
alias vi='vim'
alias emacs='emacs -nw'
alias e='emacs'
alias irssi='env TERM=xterm-color irssi'
alias ducks='du -hs * | sort -h'

alias hang='__(){ nohup $* >/dev/null 2>&1 &;};__'
alias sz='source ~/.zshrc'

alias rm='rm -i'
alias vb='vim ~/.bashrc'
alias vc='vim ~/.vimrc'
alias sb='source ~/.bashrc'
alias mcd='__(){ mkdir -m 715 $1 ; cd $1 ; } ; __'
alias l='clear'
alias ll='ls -1v -la'
alias la='ls -a'
alias tm='tmux'
alias python='python3.6'
alias py='python'
alias py2='python2'
alias cof='__(){ for f in $*; do browser "$f" 2>/dev/null ; done };__'
alias dbug='__(){ chrome https://www.udebug.com/UVa/$2; };__'
alias qsub='chrome https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=25'
alias wifi-list='nmcli dev wifi'
alias wifi-connect='__() { if [ $# -gt 1 ];then nmcli dev wifi connect $1 password $2;else nmcli dev wifi connect $1;fi }; __'
alias clean='__(){ /bin/rm -f *.stackdump *.o *.core 2>/dev/null ; swpclean;};__'
alias exp='__(){ explorer `cygpath -w "$PWD"`; };__' #\\$1
alias outt='rm -f /tmp/totalExit && exit'
alias open='__(){ nohup xdg-open $* &> /dev/null &; };__'
alias pm='ps -efu `whoami`'
alias g++='g++ -Wall'
alias gcc='gcc -Wall'
alias sss='__(){ hexo clean && hexo g && hexo s -p 8080; };__'
alias ddd='__(){ hexo clean && hexo g && hexo d && echo -e "a\n*\nq\n"| git add -i && git add -u && git commit -m "backup" && git pm; };__'
alias ssd='hexo s --draft -p 8080'
alias bc='bc -l'
alias findext='__(){ find . -regex ".*\.\($1\)"; };__'
alias vz='vim ~/.zshrc'
alias b='feh --randomize --bg-center $HOME/Pictures/WallPapers/*/*.jpg'
alias respace='for f in *\ *; do mv "$f" "${f// /_}"; done'
alias def='sdcv'
alias volup='pactl set-sink-volume 0 +5%'
alias voldown='pactl set-sink-volume 0 -5%'
alias voltog='pactl set-sink-mute 0 toggle'
alias opengl='__(){ g++ $1 -I GLTools/include/GL -I GLTools/include/ -I GLTools/src/ -I /usr/include -I /usr/local/include -I /usr/include -L /usr/X11R6/lib -L /usr/X11R6/lib64 -L /usr/local/lib -lX11 -lglut -lGL -lGLU -lm -o ${1%.*} };__'
alias telegram-cli='telegram-cli --enable-msg-id'
alias psmem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias pscpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'
alias wget='wget --user-agent="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:32.0) Gecko/20100101 Firefox/32.0" -c'

alias anash='source ~/bin/ana.sh'
alias asciiplay='CACA_DRIVER=ncurses;mplayer -really-quiet -vo caca'
alias disk='df -h --total'

alias t2s='__(){ for f in $*;do opencc -c t2s.json -i $f -o simple_$f;done; };__'
alias s2t='__(){ for f in $*;do opencc -c s2t.json -i $f -o tranditional_$f;done; };__'

# compress series
alias dotar='tar cvf' # ext dir
alias untar='tar xvf'
alias dogz='gzip' # ext
alias ungz='gunzip'
alias dotargz='tar zcvf' # ext dir
alias untargz='tar zxvf'
alias dobz='bzip2 -d' # ext
alias unbz='bunzip2'
alias untarbz='tar jxvf'
alias dobz2='bzip2 -z'
alias unbz2='bzip2 -d'
alias dotarbz2='tar jcvf' # ext dir
alias untarbz2='tar jxvf'
alias doxz='xz -z' # ext
alias unxz='xz -d'
alias dotarxz='tar Jcvf' # ext dir
alias untarxz='tar Jxvf'
alias doz='compress' # ext
alias unz='uncompress'
alias dotarz='tar Zcvf' # ext dir
alias untarz='tar Zxvf'
alias dotgz='tar zcvf' # ext dir
alias untgz='tar zxvf'
alias dotartgz='tar zcvf' # ext dir
alias untartgz='tar zxvf'
alias do7z='7z a' #-pPassword # ext
alias un7z='7z x'
alias dozip='zip -r' # ext dir
alias dorar='rar a' # ext dir
alias unrar='rar x'
alias dolha='lha -a' # ext file
alias unlha='lha -e'
alias i3-msg='i3-msg -s `i3 --get-socketpath`'
alias i3exit='i3-msg exit'
alias awexit='awesome-client "awesome.quit()"'
alias zhtg='sudo sed -i -e "s/Exec=telegram-desktop -- %u/Exec=env QT_IM_MODULE=IBus telegram-desktop -- %u/g" /usr/share/applications/telegramdesktop.desktop'

swpclean() {
    if [ -f .*.swp ];then
        for fn in `/bin/ls .*.swp`
        do /bin/rm -i $fn
        done
    fi
}

v2() {
  str=''
  arr=("$@")
  for (( i=1; i<=$#arr; i++ )); do
    if [ "$i" -eq 1 ]; then
      str+="${arr[$i]}"
    else
      str+="%20${arr[$i]}"
    fi
  done
  curl "v2en.co/$str"
}

#git filter-branch --force --index-filter \
#  "git rm --cached --ignore-unmatch hw2/nobodyzxc/Q1/O_/" \
#  --prune-empty --tag-name-filter cat -- --all
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export XCURSOR_SIZE=42
export QT_AUTO_SCREEN_SCALE_FACTOR=2 # 0
export QT_SCREEN_SCALE_FACTORS=2
