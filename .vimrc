if !exists("g:syntax_on")
  syntax enable
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if bufname('%') == ''
  set bufhidden=wipe
endif

call plug#begin('~/.vim/plugged')
  Plug 'edkolev/tmuxline.vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'lokaltog/vim-powerline'
  Plug 'myusuf3/numbers.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'scrooloose/nerdtree'
  Plug 'JamshedVesuna/vim-markdown-preview'
  Plug 'airblade/vim-gitgutter'
call plug#end()

let mapleader = " "

" set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set foldenable
set foldlevelstart=5
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
if &compatible
  set nocompatible
endif
set noerrorbells
set noshowmode
set number
set path+=**
set shiftwidth=2
set showcmd
set showmatch
set showtabline=2
set smartcase
set smartindent
set smarttab
set softtabstop=0
" set t_Co=256
set tabstop=8
set visualbell
set wildmenu
set clipboard=unnamed
set cursorline
set timeoutlen=1000
set ttimeoutlen=1

set directory^=$HOME/.vim/tmp//
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

hi CursorLine ctermbg=lightgray ctermfg=none
hi CursorLineNr ctermbg=lightgray ctermfg=white
hi LineNr ctermbg=black ctermfg=darkred 

colorscheme gruvbox

nnoremap j gj
nnoremap k gk
nnoremap <leader><C-f> :%!python -m json.tool
nnoremap <leader>c :noh<CR>

" move lines mapping on Ctrl+hjkl
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>x :bd<CR>

" enable gitgutter
nnoremap <Leader>g :GitGutterToggle<CR>

" airline config
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts=1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ' '

" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.linenr = ''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1 

" Show just the filename, not the whole path
let g:airline#extensions#tabline#fnamemod = ':t'

" Disable whitespace detection
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#buffer_idx_mode = 1

" Remove colour highlighting on section_z
let g:airline_section_warning = ''
let g:airline_section_error = ''

" tmuxline config
let g:tmuxline_preset = {
      \'a'    : '#(whoami)',
      \'b'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#W',
      \'y'    : '%d/%m %a',
      \'z'    : '%R'}

" use no special powerline symbols in tmuxline ~ reaches out to tmux in shell
" let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}

