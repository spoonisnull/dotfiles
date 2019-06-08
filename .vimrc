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
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'JamshedVesuna/vim-markdown-preview'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'connorholyday/vim-snazzy'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'PProvost/vim-ps1'
  Plug 'severin-lemaignan/vim-minimap'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'w0rp/ale'
  Plug 'tommcdo/vim-fubitive'
  Plug 'rizzatti/dash.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
call plug#end()

" cursorline
set cursorline

let mapleader = " "

set autoindent
set autoread
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
set tabstop=8
set visualbell
set wildmenu
set clipboard=unnamed
set timeoutlen=400
set ttimeoutlen=1
set mouse=a
set rnu
" set scrolloff=10
set directory^=$HOME/.vim/tmp//
set termguicolors
set shortmess+=A

" cursorline
hi CursorLine cterm=NONE ctermbg=none ctermfg=none guibg=darkred guifg=white
hi CursorLineNr ctermbg=black ctermfg=darkred guibg=black guifg=white
hi LineNr ctermbg=black ctermfg=darkred 

" tmuxline config
" leT g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'b'    : '#(~/.tmux/tmux_sessions.sh)',
"       \'win'  : '#I #W',
"       \'cwin' : '▶ #I #W',
"       \'y'    : '%d/%m %a',
"       \'z'    : '%R'}

" " use no special powerline symbols in tmuxline ~ reaches out to tmux in shell
" " let g:tmuxline_powerline_separators = 0
" let g:tmuxline_separators = {
"     \ 'left' : '',
"     \ 'left_alt': '',
"     \ 'right' : '',
"     \ 'right_alt' : '',
" \ 'space' : ' '}

" markdown
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

let g:gitgutter_override_sign_column_highlight = 1
hi SignColumn ctermbg=black ctermfg=darkred
hi GitGutterAdd ctermbg=black ctermfg=darkgreen
hi GitGutterChange ctermbg=black ctermfg=darkyellow
hi GitGutterDelete ctermbg=black ctermfg=darkred
hi GitGutterChangeDelete ctermbg=black ctermfg=darkred

let g:SnazzyTransparent = 1

nnoremap j gj
nnoremap k gk

" Clipboard
nnoremap <Leader>c :.w !pbcopy<CR><CR>
vnoremap <silent> <leader>c :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>

" move lines mapping on Ctrl+hjkl
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <Leader>e :e 
nnoremap <Leader>w :w<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>H <C-w>h<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>L <C-w>l<CR>
nnoremap <Leader>J <C-w>j<CR>
nnoremap <Leader>K <C-w>k<CR>
nnoremap <Leader>x :bd!<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>F :%!python -m json.tool<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>m :MinimapToggle<CR>

" enable gitgutter
nnoremap <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>j Lzz
nnoremap <Leader>k Hzz

" fugitive
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>b :Gblame<CR>

" nerdtree
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>p :let NERDTreeQuitOnOpen=1<CR>
nnoremap <Leader>P :let NERDTreeQuitOnOpen=0<CR>

" ctags
inoremap <C-f> g<C-]>
nnoremap <C-f> g<C-]>

" fzf.vim
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>G :GFiles?<CR>
nnoremap <Leader>C :Commits<CR>
nnoremap <S-Tab> :Buffers<CR>

" if exists('$TMUX')
"   " Colors in tmux
"   let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
" endif

let g:jellybeans_overrides = {
\    'background': { 'guibg': '000000' },
\}

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

set t_Co=256
colors gruvbox
set background=dark

let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=60
let NERDTreeShowHidden=1

" minimap
let g:minimap_highlight='LineNr'
 
" dash
nnoremap <Leader>D :Dash<CR>


" airline config
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts=1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ' '

let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.linenr = ''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1 

" Show just the filename, not the whole path
let g:airline#extensions#tabline#fnamemod = ':t'

" Disable whitespace detection
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

