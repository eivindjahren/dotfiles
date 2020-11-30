filetype indent on

set background=dark
set noexrc
syntax on
set undofile
set undolevels=1000
set undoreload=10000
"set autochdir
set noerrorbells
set t_vb=
set number
set expandtab
set nowrap
set shiftwidth=4
set tabstop=4
set noswapfile


" https://github.com/junegunn/vim-plug
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'simnalamburt/vim-mundo'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'lervag/vimtex'
Plug 'joshdick/onedark.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-vinegar'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'fisadev/vim-isort'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }  }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
call plug#end()
autocmd BufWritePre *.py silent! execute ':Isort'
autocmd BufWritePre *.py silent! execute ':Black'
noremap <F3> :Neoformat<CR>


"Fixes an error where isort jumps around and
"dont care about formatting anyways because of black
let g:vim_isort_config_overrides = {'multi_line_output': 3}

colorscheme onedark
let g:airline_theme='kalisi'

"Gundo Configuration
nnoremap <F5> :MundoToggle<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
tnoremap <Esc> <C-\><C-n>
set mouse=a

"tab configuration
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td :tabclose<CR>

"vimtex configuration
let g:tex_flavor = 'latex'

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
