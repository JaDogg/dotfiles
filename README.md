# dotfiles
.vimrc, _vimrc, etc

## Installing Plugins
```
mkdir -p .vim/pack/vendor/start
cd .vim/pack/vendor/start/
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/vim-scripts/RltvNmbr.vim.git
git clone https://github.com/fatih/vim-go.git
git clone https://github.com/Shougo/neocomplete.vim.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/python-mode/python-mode.git
git clone --recurse-submodules https://github.com/python-mode/python-mode.git
git clone https://github.com/arp242/confirm_quit.vim.git
git clone https://github.com/artur-shaik/vim-javacomplete2.git
cd .vim/pack/vendor/start/vim-javacomplete2/libs/javavi
mvn compile
```
* Also install ripgrep so it can be used with `:grep`
