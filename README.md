# public-dotfiles

1. ```brew install neovim```
2. ```mkdir ~/.config/nvim```
3. ```touch ~/.config/nvim/init.vim```
4. Add the following to your `init.vim`
    ```
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc
    ```
5. install vim-plug:
    ```
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs [https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
    ```
6. Open a file with vim and type `:PlugInstall`
7. ./link.sh
8. restart terminal
