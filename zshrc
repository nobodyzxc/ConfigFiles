# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/zxc/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
ZSH_CUSTOM=/usr/share/zsh/plugins/zsh-autosuggestions/

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
#plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
sf="~/public_html/share"
cherry="s10410@cherry.cs.nccu.edu.tw"
share="${cherry}:$sf"
alias share='__(){ if [ $# -gt 1 ];then scp $1 ${share}/$2; ssh $cherry chmod 644 ${sf}/$2;else scp $1 ${share}; ssh $cherry chmod 644 ${sf}/$1;fi; } ; __'
alias ls='/bin/ls -NF --color=auto'
alias sl='ls'
alias vim='env TERM=xterm-color vim'
alias e='emacs'
alias irssi='env TERM=xterm-color irssi'
alias ducks='du -ksm * |sort -rn |head -20'

alias hang='__(){ nohup $* >/dev/null 2>&1 &;};__'
alias sz='source ~/.zshrc'

alias rm='rm -i'
alias vb='vim ~/.bashrc'
# 'gf' in vim to open a filename
alias vc='vim ~/.vimrc'
alias sb='source ~/.bashrc'
alias mcd='__(){ mkdir -m 715 $1 ; cd $1 ; } ; __'
alias l='clear'
alias ll='ls -la'
alias la='ls -a'
alias tm='tmux'
#alias python='python3'
alias python='python3.6'
alias py='python'
alias py2='python2'
alias g='chrome>/dev/null 2>&1 &'
alias cof='__(){ for f in $*; do chromium "$f" 2>/dev/null ; done };__'
alias dbug='_(){ chrome https://www.udebug.com/UVa/$2; };_'
alias qsub='chrome https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=25'
alias wifi-list='nmcli dev wifi'
alias wifi-connect='__() { if [ $# -gt 1 ];then nmcli dev wifi connect $1 password $2;else nmcli dev wifi connect $1;fi }; __'
swpclean() {
    if [ -f .*.swp ];then
        for fn in `/bin/ls .*.swp`
        do /bin/rm -i $fn
        done
    fi
}
alias clean='_(){ /bin/rm -f *.stackdump *.o *.core 2>/dev/null ; swpclean;};_'
alias exp='_(){ explorer `cygpath -w "$PWD"`; };_' #\\$1
alias outt='rm -f /tmp/totalExit && exit'
alias open='__(){ nohup xdg-open $* &> /dev/null &; };__'
alias pm='ps -efu `whoami`'
alias g++='g++ -Wall'
alias gcc='gcc -Wall'
alias sss='__(){ hexo clean && hexo g && hexo s -p 8080; };__'
alias ddd='__(){ hexo clean && hexo g && hexo d && echo -e "a\n*\nq\n"| git add -i && git add -u && git commit -m "backup" && git pm; };__'
alias ssd='hexo s --draft -p 8080'
alias bc='bc -l'
alias findext='_(){ find . -regex ".*\.\($1\)"; };_'
alias vz='vim ~/.zshrc'
alias b='feh --randomize --bg-center $HOME/Pictures/WallPapers/*/*.jpg'
# sudo taskmgr
# cyg-get
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


set | /usr/bin/grep "RUN_TMUX" > /dev/null
if [ $? = 1 ];then
    export RUN_TMUX=1
    touch /tmp/totalExit
    tmux -u
    if [ -f /tmp/totalExit ];then
        rm -f /tmp/totalExit
        exit
    fi
    RUN_TMUX=0
    clear
fi
PATH=$PATH:/home/zxc/.local/bin
#eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
export PKG_CONFIG=/usr/bin/pkg-config
export PKG_CONFIG_PATH=/usr/share/pkgconfig:/usr/lib/pkgconfig
PATH=$PATH:~/bin:~/.yarn/bin
export CFLAGS=-fPIC
export CXXFLAGS=-fPIC
alias asciiplay='CACA_DRIVER=ncurses;mplayer -really-quiet -vo caca'
bindkey '^ ' autosuggest-accept

alias anash='source ~/bin/ana.sh'
### added by Anaconda3 installer
## export PATH="/usr/local/anaconda/bin:$PATH"  # commented out by conda initialize
#
## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/usr/local/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/usr/local/anaconda/etc/profile.d/conda.sh" ]; then
#        . "/usr/local/anaconda/etc/profile.d/conda.sh"
#    else
#        export PATH="/usr/local/anaconda/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<

PYTHONPATH=$PYTHONPATH:/home/zxc/GitHub/z3-z3-4.5.0/build/python
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/zxc/GitHub/z3-z3-4.5.0/build

