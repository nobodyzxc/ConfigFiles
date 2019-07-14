SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ln -s "$SCRIPTPATH/alias.sh"           ~/.alias.sh
ln -s "$SCRIPTPATH/antergos.bashrc.sh" ~/.bashrc
ln -s "$SCRIPTPATH/inputrc"            ~/.inputrc
ln -s "$SCRIPTPATH/tmux.conf"          ~/.tmux.conf
ln -s "$SCRIPTPATH/zshrc"              ~/.zshrc
ln -s "$SCRIPTPATH/screenrc"           ~/.screenrc
ln -s "$SCRIPTPATH/ghci"               ~/.ghci
ln -s "$SCRIPTPATH/gitconfig"          ~/.gitconfig

echo "source $SCRIPTPATH/vimrc.vim"      >> ~/.vimrc
echo "source $SCRIPTPATH/extensions.vim" >> ~/.vimrc

mkdir --parents ~/.config/termite
ln -s "$SCRIPTPATH/termite.config"      ~/.config/termite/config
mkdir --parents ~/.config/terminator
ln -s "$SCRIPTPATH/terminator.config"   ~/.config/terminator/config
mkdir --parents ~/.config/i3
ln -s "$SCRIPTPATH/i3.conf"             ~/.config/i3/config
