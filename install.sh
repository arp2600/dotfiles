location=`pwd`

echo "Soft linkinng .bashrc"
ln -s $location/dotfiles/bashrc ~/.bashrc
echo "Soft linkinng .inputrc"
ln -s $location/dotfiles/inputrc ~/.inputrc
echo "Soft linkinng .vimrc"
ln -s $location/dotfiles/vimrc ~/.vimrc
echo "Soft linkinng .vim"
ln -s $location/dotfiles/vim ~/.vim
echo "Soft linking rubbish.py"
ln -s $location/dotfiles/rubbish.py ~/bin/ru
mkdir ~/Rubbish
echo "Soft linking gitconfig"
ln -s $location/dotfiles/gitconfig ~/.gitconfig
