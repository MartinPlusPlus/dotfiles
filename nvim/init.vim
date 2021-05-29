" Specify a directory for plugins
" To install the plugins, run the following:
" 	:PlugInstall
" 	:UpdateRemotePlugins
call plug#begin()
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',
Plug 'scrooloose/nerdtree',
Plug 'scrooloose/syntastic',
Plug 'tpope/vim-surround',
Plug 'scrooloose/nerdcommenter',
Plug 'jiangmiao/auto-pairs',
Plug 'sheerun/vim-polyglot',
Plug 'Yggdroot/indentline',
Plug 'conormcd/matchindent.vim',
call plug#end()

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:deoplete#enable_at_startup=1
let g:syntastic_python_checkers = ['flake8']

"packadd! dracula
"colorscheme dracula
"syntax enable
set number
set expandtab
set shiftwidth=4
set tabstop=4

