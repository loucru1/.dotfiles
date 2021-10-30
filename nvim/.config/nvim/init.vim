" As of 10/09/21, this file was modeled after
" this video: https://youtu.be/DogKdiRx7ls

" use :h [option] to find more information
" on what the option does
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set termguicolors

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'lewis6991/spellsitter.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'folke/todo-comments.nvim'

" One of following
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'liuchengxu/vim-clap'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Automatically install and update global extensions for coc
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" Typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'jxnblk/vim-mdx-js'


" Requires
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

call plug#end()

lua require("todo-comments").setup {}

lua require('spellsitter').setup()

colorscheme gruvbox


" Enable vim-iced's default key mapping
" This is recommended for newbies
let g:iced_enable_default_key_mappings = v:true


" Key remaps

" set <leader> to space
noremap <Space> <Nop>
let mapleader = "\<BS>"
let maplocalleader = " "

" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>


" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G



" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


augroup ON_SAVE
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
