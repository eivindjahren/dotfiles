filetype plugin on
filetype indent on

set background=dark
set noexrc
syntax on
set undofile
set undodir=~/.local/share/nvim/undo
set undolevels=1000
set undoreload=10000
set autochdir
set noerrorbells
set t_vb=
set number
set expandtab
set nowrap
set shiftwidth=2
set tabstop=2


" https://github.com/junegunn/vim-plug
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'sjl/gundo.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'https://github.com/freeo/vim-kalisi'
Plug 'https://github.com/tpope/vim-fugitive'
call plug#end()

noremap <F3> :Autoformat<CR>

let g:tex_flavor = "latex"
colorscheme kalisi
let g:airline_theme='kalisi'

"Gundo Configuration
nnoremap <F5> :GundoToggle<CR>

"tab configuration
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
