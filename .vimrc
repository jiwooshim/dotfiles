set nocompatible              " be iMproved, required
filetype off                  " required
let need_to_install_plugins=0
if empty(system("grep lazy_load ~/.vim/bundle/vundle/autoload/vundle.vim"))
    echo "Installing Vundle..."
    echo ""
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let need_to_install_plugins=1
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'puremourning/vimspector'
Plugin 'sagi-z/vimspectorpy' 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
"Plugin 'python-mode/python-mode'
Plugin 'ap/vim-buftabline'
"Plugin 'lambdalisue/vim-pyenv'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
set path+=**

if need_to_install_plugins==1
    echo "Installing plugins..."
    silent! PluginInstall
    echo "Done!"
    q
endif
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" color scheme
syntax on
colorscheme onedark
filetype on
filetype plugin indent on

" open NERDTree automatically when Vim starts
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" move through buffers
set hidden
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>

" Mouse cursor
set ttymouse=xterm2
set mouse=a
let g:NERDTreeMouseMode=3

let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>db <Plug>VimspectorBreakpoints
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

" set line number and line color
set number relativenumber
hi LineNr ctermfg=grey
hi CursorLineNr ctermfg=brown
set cursorline

" Set backspace key 
set backspace=indent,eol,start

" file browser
map <leader>t :NERDTreeToggle<CR>

" Pyenv config
let g:python3_host_prog=$HOME.'/.venv/bin/python3'

" zoom in spaces
"nmap <leader>wo :tab split
"nmap <leader>wp :hide

" convert all typed tabs to spaces
set expandtab




