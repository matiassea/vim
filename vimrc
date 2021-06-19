"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :q<cr>


" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" cuantas lineas baja con el raton
set scr=8

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32") 
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler


set encoding=utf-8


" Display options
set showmode
set showcmd

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
"syntax enable 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colors palette in Gnome Terminal
"if $COLORTERM == 'gnome-terminal'
"    set t_Co=256
"endif

"try
    "colorscheme desert
"catch
"endtry
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Set extra options when running in GUI mode
"if has("gui_running")
"    set guioptions-=T
"    set guioptions-=e
"    set t_Co=256
"    set guitablabel=%M\ %t
"endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
set nu
set rnu
set nornu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Configuracion de numeros
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax/
"https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
"https://phoenixnap.com/kb/vim-color-schemes

"syntax enable
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"highlight Normal ctermfg=5 ctermbg=0
"highlight Comment cterm=underline ctermbg=Blue ctermfg=White

" enable all Python syntax highlighting features
"let python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4 "tells vim how many spaces a tab should take up. 

"PEP 8
set softtabstop=4
set textwidth=79
set fileformat=unix

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"# https://www.fullstackpython.com/vim.html
"# https://www.fullstackpython.com/vim.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Agregado el 18-05

" enable syntax highlighting
"syntax enable

" show line numbers
set number
set relativenumber

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab "converts all tabs to spaces. 

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4 "option controls the depth of autoindentation

" show a visual line under the cursor's current line
"set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Para ejecutar comando Python, solo apretando F9
"https://stackoverflow.com/questions/18948491/running-python-code-in-vim
"https://justin.abrah.ms/vim/vim_and_python.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://stackoverflow.com/questions/18948491/running-python-code-in-vim

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

"imap <F5> <Esc>:w<CR>:!clear;python %<CR>

"autocmd FileType python nnoremap <buffer> <F5> :w<CR>:ter python2 "%"<CR>
"autocmd FileType python nnoremap <buffer> <F6> :w<CR>:vert ter python3 "%"<CR>

"https://stackoverflow.com/questions/18948491/running-python-code-in-vim
"autocmd: command that Vim will execute automatically on {event} (here: if you open a python file)
"[i]map: creates a keyboard shortcut to <F9> in insert/normal mode
"<buffer>: If multiple buffers/files are open: just use the active one
"<esc>: leaving insert mode
":w<CR>: saves your file
"!: runs the following command in your shell (try :!ls)
"%: is replaced by the filename of your active buffer. But since it can contain things like whitespace and other "bad" stuff it is better practise not to write :python %, but use:
"shellescape: escape the special characters. The 1 means with a backslash
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://stackoverflow.com/questions/18948491/running-python-code-in-vim
"Para controlar el tamaño de la pantalla
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lines=40
set columns=150

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set working directory
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"but only change the path for the current window
"https://vimways.org/2019/vim-and-the-working-directory
nnoremap <leader>cd :lcd %:h<cr>
"% represents the current file, and what’s after the : is called a “filename modifier”
"h is a filename modifier corresponding to the “dirname” of the file
nnoremap <leader>t :ter<cr>
"open terminal
"set termsize=10x0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle
"Es el plugins para el uso de Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Link a revisar
"https://realpython.com/vim-and-python-a-match-made-in-heaven/
"https://realpython.com/vim-and-python-a-match-made-in-heaven/

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call vundle#rc()


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#rc('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ..

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'rstacruz/sparkup', {'rtp': 'vim'} 
Plugin 'morhetz/gruvbox'
set background=dark
colorscheme gruvbox

let g:gruvbox_termcolors=16
let g:gruvbox_italic=1
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Airline plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/vim-airline/vim-airline

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_experimental = 1

"the separator used on the left side
let g:airline_left_sep='>'

"the separator used on the right side
let g:airline_right_sep='<'

":AirlineTheme simple
:let g:airline_theme='simple'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enhance the default python syntax highlighting

"http://liuchengxu.org/posts/use-vim-as-a-python-ide/

"hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

"python-mode/python-mode provides a more precise python syntax highlighting than the defaults. 
"For example, you can add a highlighting for pythonSelf 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Solareized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin 'altercation/vim-colors-solarized'
"syntax enable
"set background=dark
"colorscheme solarized

""Configuraciones avanzadas
"let g:solarized_termcolors=256
"let g:solarized_termtrans =1


"https://phoenixnap.com/kb/vim-color-schemes
"https://vimcolorschemes.com/
"colorscheme slate
"https://vimcolors.com/
"set background=dark

"highlight Normal ctermfg=5 ctermbg=0
"syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Split
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Code Folding
"Most “modern” IDEs provide a way to collapse (or fold) methods and classes, 
"showing you just the class/method definition lines instead of all the code.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Se suspende debido a que distorsiona el space
" Enable folding
"set foldmethod=indent
"set foldlevel=99

" Enable folding with the spacebar
"nnoremap <space> za
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"https://realpython.com/vim-and-python-a-match-made-in-heaven/
"You can have VIM check your syntax on each save with the syntastic extension:
"Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8'
"Finally, make your code look pretty:

"let python_highlight_all=1
syntax enable
"""""""""""""""
" atajo de teclado
"""""""""""""""
map <leader>ds :Explore Desktop/data scientist<cr>

map <leader>w :w<cr>
"map <leader>m <S-2><cr>
map <leader>q :q<cr>
"""""""""""""""""""""""""""""""""""""""""""""

"Para cuando se abra un parentesis, lo cierre.
set showmatch

"Pantalla maximizada
"autocmd GUIEnter * simalt ~n

