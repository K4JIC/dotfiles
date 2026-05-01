""set nocompatible
set encoding=utf-8
set number
set relativenumber
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set cino={0
set autoindent
set cursorline
set showmatch
set smartcase
set ignorecase
set hlsearch
set incsearch
set nowrap
set mouse=n
set listchars=tab:>-,trail:·,eol:$
set list
set bin noeol
set colorcolumn=80
set termguicolors

"highlight
highlight NonText ctermfg=236 guifg=#1c1c1c
highlight Whitespace ctermfg=236 guifg=#1c1c1c
highlight SpecialKey ctermfg=236 guifg=#1c1c1c
let c_functions = 1

"normap
imap jk <Esc>
nnoremap <Esc>j :m .+1<CR>==
nnoremap <Esc>k :m .-2<CR>==
xnoremap <Esc>j :m '>+1<CR>gv=gv
xnoremap <Esc>k :m '<-2<CR>gv=gv
set clipboard^=unnamedplus
noremap gy "+y

"c
autocmd FileType c nnoremap <F5> :w<CR>:!gcc % -o %< && ./%<<CR>
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType c setlocal formatoptions=croql
autocmd FileType c setlocal makeprg=gcc\ -Wall\ -Wextra\ -std=c11\ %

"personal
let g:user42 = 'tozaki'
let g:mail42 = 'tozaki@student.42tokyo.jp'

"pligin
call plug#begin()
Plug 'lambdalisue/vim-fern'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug '42Paris/42header'
call plug#end()

"Fern
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=25<CR>
let g:fern_disable_startup_warnings = 1
"gruvbox
set background=dark
colorscheme gruvbox

"catppuccin
"colorscheme catppuccin_mocha
"let g:lightline = {'colorscheme': 'catppuccin_mocha'}

"lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
