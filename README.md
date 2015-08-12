dotfiles
========

Install Vundle into .vim/bundle/vundle

Plugins that have extra install steps
* https://github.com/marijnh/tern_for_vim
* https://github.com/Valloric/YouCompleteMe

*tern_for_vim*
cd ~/.vim/bundle
git clone git@github.com:marijnh/tern_for_vim.git
npm install tern_for_vim

*YouCompleteMe*
sudo apt-get install build-essential cmake
sudo apt-get install python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

