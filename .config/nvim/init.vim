syntax on  

set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set relativenumber
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=UTF-8
set splitbelow splitright

"--------------------------------------------------
" => plugins
"--------------------------------------------------
call plug#begin('~/local/share/nvim/plugged')

" => Theme plugins
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'python-mode/python-mode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim hardmode plugin
Plug 'wikitopian/hardmode'

call plug#end()

"--------------------------------------------------
" => colorscheme
"--------------------------------------------------
colorscheme onedark
"colorscheme gruvbox
set background=dark

"--------------------------------------------------
" => keybindings
"--------------------------------------------------
let mapleader=","
map <Leader>tt :vnew term://fish<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"--------------------------------------------------
" => splits and tabs
"--------------------------------------------------
" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split size adjusting
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

"Switch between vertical and horizontal split
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"--------------------------------------------------
" => nerdtree
"--------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFocus<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'


"--------------------------------------------------
" => coc config
"--------------------------------------------------
let g:coc_global_extensions = [
        \ 'coc-snippets',
        \ 'coc-pairs',
        \ 'coc-eslint',
        \ 'coc-prettier',
        \ 'coc-json',
        \]

"--------------------------------------------------
" => lightline
"--------------------------------------------------
let g:lightline = {
        \ 'colorscheme': 'one',
        \ }

set laststatus=2

set noshowmode

"--------------------------------------------------
" => Mouse scrolling
"--------------------------------------------------
set mouse=nicr
