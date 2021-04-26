SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ln -sf "$SCRIPTPATH/alias.sh"           ~/.alias.sh
ln -sf "$SCRIPTPATH/antergos.bashrc.sh" ~/.bashrc
ln -sf "$SCRIPTPATH/inputrc"            ~/.inputrc
ln -sf "$SCRIPTPATH/tmuxs/kab.conf"     ~/.tmux.conf
ln -sf "$SCRIPTPATH/zshrc"              ~/.zshrc
ln -sf "$SCRIPTPATH/screenrc"           ~/.screenrc
ln -sf "$SCRIPTPATH/ghci"               ~/.ghci
ln -sf "$SCRIPTPATH/gitconfig"          ~/.gitconfig

#echo "source $SCRIPTPATH/vimrc.vim"      >> ~/.vimrc
#echo "source $SCRIPTPATH/extensions.vim" >> ~/.vimrc

mkdir --parents ~/.config/termite
ln -sf "$SCRIPTPATH/termite.config"      ~/.config/termite/config
mkdir --parents ~/.config/terminator
ln -sf "$SCRIPTPATH/terminator.config"   ~/.config/terminator/config
mkdir --parents ~/.config/i3
ln -sf "$SCRIPTPATH/i3.conf"             ~/.config/i3/config
