
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Ag<CR>

let mapleader = ","
nnoremap <leader>b :ls<CR>:b
"nnoremap <leader>n :bn<CR>
"nnoremap <leader>p :bp<CR>

syntax on
set encoding=utf-8

set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set hidden

call plug#begin()

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/davidhalter/jedi-vim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/Vimjas/vim-python-pep8-indent'
Plug 'https://github.com/dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'ThePrimeagen/harpoon'
"Plug 'https://github.com/ctrlpvim/ctrlp.vim'"
"Themes =================================================================
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/jacoborus/tender.vim'
Plug 'morhetz/gruvbox'

call plug#end()

"Colour Scheme"
colorscheme gruvbox
set background=dark

"Runs current python file"
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"Formats python file on save"
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {'python': ['autopep8', 'yapf']}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

"Jedi"
autocmd FileType python setlocal completeopt-=preview

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

"ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

