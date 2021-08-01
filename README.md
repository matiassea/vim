# vim
my commands to vim

:scriptnames list all the .vim files that Vim loaded for you, including your .vimrc file.

:e $MYVIMRC open & edit the current .vimrc that you are using, then use Ctrl + G to view the path in status bar.


https://dev.to/shahinsha/how-to-make-vim-a-python-ide-best-ide-for-python-23e1


Let's install vundle:

Open your terminal and type :
```
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

abrir vim y escribir :version
utilizar la ruta que aparece en "user vimrc file"
ir por la terminal a esa ruta
escribir => vim .vmrc

En el file vimrc, copy and paste

"""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
"""

Salir y grabar

entrar a vim y escribir :PluginInstall

