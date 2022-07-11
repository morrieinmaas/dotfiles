" use system clipboard
set clipboard+=unnamedplus

" Plugins for vim-plug
call plug#begin()
 "colorschemes
 Plug 'rafi/awesome-vim-colorschemes'
 " Dev Icons for files
 Plug 'ryanoasis/vim-devicons'
 " Treesitter
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 " BufferLine
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'akinsho/bufferline.nvim'
 " nonicons
 Plug 'yamatsum/nvim-nonicons'
 " nerdtree
 Plug 'scrooloose/nerdtree'
 "Telescope
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 " coc code completion
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 " airline
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 " git blame
 Plug 'f-person/git-blame.nvim'
 " ale
 Plug 'dense-analysis/ale'
 " Sleuth indenter
 Plug 'tpope/vim-sleuth'
 " ctrl-space
 Plug 'vim-ctrlspace/vim-ctrlspace'
 " git 
 Plug 'tpope/vim-fugitive'
 " ayu theme
 Plug 'ayu-theme/ayu-vim'
call plug#end()

" ayu theme setting
let ayucolor="dark"
" set colorscheme
colo ayu
set termguicolors
" use zsh
set shell=zsh
set shellcmdflag=-l

" air-line
" let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" enable git blame
let g:gitblame_enabled = 1

" unicode symbols for airline
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" airline plugins
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_extensions = ['branch', 'tabline', 'ale']
let g:airline#extensions#branch#enabled = 1

" enable mouse click
set mouse=a

"By default use ---relative--- line numbers
set relativenumber

" map leader to Space
let mapleader=" "

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" map command key from colon to semi colon in normal mode
nmap ; :

" open file
nnoremap <leader>oo :e 
" edit vim config
nnoremap <leader>ov :e ~/.config/nvim/init.vim<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>p <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" find hidden files
nnoremap geh <cmd>Telescope find_files hidden=true<cr>

" find in file
nnoremap <leader>f /

" tab cycle
inoremap <silent><expr> <Tab>
     \ pumvisible() ? "\<C-n>" : "\<TAB>"

" Nerdtree
nnoremap <silent> <leader>E :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<cr>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Bufferline
" vim.opt.termguicolors = true
" require("bufferline").setup{}

" Cycle buffers
nnoremap <leader>n :bnext<CR>
nnoremap <leader>N :bprevious<CR>

" close buffer
nnoremap <leader>bc :bd!<CR>

" Save all open buffers
nnoremap <leader>s :w<CR>
" close all open buffers and safe
nnoremap <leader>Z :xa<CR>
" close vim if no unsaved changes
nnoremap <leader>q :qa<CR>
" close vim anyway
nnoremap <leader>Q :qa!<CR>

" close buffer
nnoremap <leader>bd :bd<CR>

" change colorscheme
nnoremap <leader>kt :colorscheme 

" tab is 4 spaces for python
" set tabstop=4

" highlight search results
set hlsearch

" enable spellcheck
set spelllang=en " ,nl,de
set spell
nnoremap <silent> <leader>sc :set spell!<cr>

" convert tabs to whitespaces and vice versa
" set expandtab
" set softtabstop=2

" column hint 
set cc=120

" tab completion
set wildmode=longest,list

" Split panes
set splitbelow
set splitright

" split panes
nnoremap <leader>[ :split<CR>
nnoremap <leader>] :vsplit<CR>

" navigation buffers
nnoremap <leader>j <C-W><C-J>

nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

nnoremap <leader>tt :!

" pep scrolling
set ttyfast

" no swap file
set noswapfile

set termguicolors
lua << EOF
require("bufferline").setup{}
EOF
"set encoding=UTF-8

" coc completion with tab
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~# '\s'
endfunction

