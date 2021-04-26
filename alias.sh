sf="~/public_html/share"
cherry="s10410@cherry.cs.nccu.edu.tw"
share="${cherry}:$sf"
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
#alias python='python3.6'
#alias pip='pip3.6'
#alias py='python'
#alias py2='python2'
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
alias bg='__(){feh --randomize --bg-center $HOME/Pictures/WallPapers/$1/*.jpg;};__'
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
alias vpn='sudo openfortivpn 140.113.235.174:443 -u zxchen'

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

if test "$HOST" = "plas" ;then
alias lock='~/.i3/i3lock-multimonitor/lock'
#alias mv='rsync --info=progress2'
#alias cp="rsync -avz"
fi
alias sshserver='autossh -M 20000 -i ~/.ssh/id_rsa -NfR 2222:localhost:22 lab'
alias tosticker='__(){for fn in $*; do convert $fn -quality 90% -resize 512x512 512_${fn%.*}.png;done};__'
alias nsd='ssh -i "nobodyzxc.pem" ubuntu@ec2-3-85-119-217.compute-1.amazonaws.com'
alias pf='perf record --call-graph dwarf'
alias zhtg='sudo sed -i -e "s/Exec=telegram-desktop -- %u/Exec=env QT_IM_MODULE=IBus telegram-desktop -- %u/g" /usr/share/applications/telegramdesktop.desktop'
alias irssi='TERM=tmux&&irssi'
alias filedx='find . -type f -exec chmod a-x {} \;'


alias ana='source /opt/anaconda/bin/activate'
alias nan='conda deactivate'
alias lspg='cmake -H. -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES;ln -s Debug/compile_commands.json .'

#conda create --name python36 python=3.6
#conda info -e
#source activate python36
#conda create --name new_env_name --clone org_env_name
#conda remove --name python36 --all
#conda install scipy
#conda list
#conda list -n python36
#conda install -n python36 numpy
#conda search numpy
#conda update -n python36 numpy
#conda remove -n python36 numpy
#conda update conda
#conda update anaconda
#conda update python
export TERMINFO=/usr/share/terminfo
alias playback='pactl load-module module-loopback latency_msec=10'
alias unplayback='pactl unload-module module-loopback'
alias streaming='ffmpeg-screen-recorder -a -o rtmp://x.rtmp.youtube.com/live2/b2kh-mwqm-j6ay-1a9e'
alias run='qemu-system-aarch64 -serial null -serial stdio -M raspi3 -kernel kernel8.img -display none'
#alias poweroff='sudo poweroff -f'
#alias reboot='sudo reboot -f'
alias mlab='sshfs lab:/home/zxc /home/zxc/lab'
alias octave='octave --persist'
#alias python='python3.6'
alias v2v='__(){ ffmpeg -i $1 -vf "fps=4,scale=1024:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $2; } ; __'
PATH=$PATH:~/.dotnet/tools

export LD_LIBRARY_PATH="$HOME/rabbit/lib:$LD_LIBRARY_PATH"
export PATH="$HOME/rabbit/bin:$PATH"
alias https='python -m http.server'
alias tl='telnet 127.0.0.1'
alias jasmin='java -jar ~/bin/jasmin.jar'

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
alias recmic='arecord -vv -fdat'
