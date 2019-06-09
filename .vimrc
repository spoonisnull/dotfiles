if !exists("g:syntax_on")
  syntax enable
endif

let $MYVIMRC = '~/.vimrc'

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
  Plug 'terryma/vim-multiple-cursors'
  Plug 'w0rp/ale'
  Plug 'tommcdo/vim-fubitive'
  Plug 'rizzatti/dash.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neoclide/coc.nvim', {'do': './install.sh nightlyll/undotree'}
  Plug 'mbbill/undotree'
call plug#end()
"
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
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END
" set scrolloff=10
set directory^=$HOME/.vim/tmp//
set termguicolors
set shortmess+=A
set undofile
" set foldcolumn=5
set inccommand=nosplit
set list lcs=trail:·,tab:»·

" cursorline
hi CursorLine cterm=NONE ctermbg=none ctermfg=none guibg=darkred guifg=white
hi CursorLineNr ctermbg=black ctermfg=darkred guibg=black guifg=white
hi LineNr ctermbg=black ctermfg=darkred

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

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap Q @@
nnoremap H ^

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
nnoremap <Leader>v :e $MYVIMRC<CR>

" enable gitgutter
nnoremap <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>j Lzz
nnoremap <Leader>k Hzz

" fugitive
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>b :Gblame<CR>
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <Leader>G :Ggrep

" nerdtree
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>p :let NERDTreeQuitOnOpen=1<CR>
nnoremap <Leader>P :let NERDTreeQuitOnOpen=0<CR>
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1

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

" ctags
inoremap <C-f> g<C-]>
nnoremap <C-f> g<C-]>

" fzf.vim
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>S :GFiles?<CR>
nnoremap <Leader>C :Commits<CR>
nnoremap <S-Tab> :Buffers<CR>

set t_Co=256
colors gruvbox
set background=dark

" dash
nnoremap <Leader>D :Dash<CR>

" indentline
" let g:indentLine_char = '┊'
let g:indentLine_char = '▏'

" coc.vim
autocmd FileType json syntax match Comment +\/\/.\+$+
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" airline config
let g:airline_theme = 'gruvbox'
let g:airline_focuslost_inactive = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.linenr = ''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'c'  : 'COM',
    \ 'i'  : 'INS',
    \ 'ic' : 'INS',
    \ 'ix' : 'INS',
    \ 'n'  : 'NOR',
    \ 'ni' : 'NOR',
    \ 'no' : 'NOR',
    \ 'R'  : 'REP',
    \ 'Rv' : 'REP',
    \ 's'  : 'SEL',
    \ 'S'  : 'SEL',
    \ '' : 'SEL',
    \ 't'  : 'T',
    \ 'v'  : 'VIS',
    \ 'V'  : 'VIS',
    \ '' : 'VIS',
    \ }

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Tabline splits
let g:airline#extensions#tabline#show_splits = 1

" Tabline separators
let g:airline#extensions#tabline#left_sep = '█'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = '█'
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#buffer_idx_mode = 1

" Show just the filename, not the whole path
let g:airline#extensions#tabline#fnamemod = ':t'

" Disable whitespace detection
let g:airline#extensions#whitespace#enabled = 1

" ctags
inoremap <C-f> g<C-]>
nnoremap <C-f> g<C-]>

" fzf.vim
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>S :GFiles?<CR>
nnoremap <Leader>C :Commits<CR>
nnoremap <S-Tab> :Buffers<CR>

set t_Co=256
colors gruvbox
set background=dark


" minimap
let g:minimap_highlight='LineNr'

" dash
nnoremap <Leader>D :Dash<CR>

" indentline
" let g:indentLine_char = '┊'
let g:indentLine_char = '▏'

" coc.vim
autocmd FileType json syntax match Comment +\/\/.\+$+
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" airline config
let g:airline_theme = 'gruvbox'
let g:airline_focuslost_inactive = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.linenr = ''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'c'  : 'COM',
    \ 'i'  : 'INS',
    \ 'ic' : 'INS',
    \ 'ix' : 'INS',
    \ 'n'  : 'NOR',
    \ 'ni' : 'NOR',
    \ 'no' : 'NOR',
    \ 'R'  : 'REP',
    \ 'Rv' : 'REP',
    \ 's'  : 'SEL',
    \ 'S'  : 'SEL',
    \ '' : 'SEL',
    \ 't'  : 'T',
    \ 'v'  : 'VIS',
    \ 'V'  : 'VIS',
    \ '' : 'VIS',
    \ }

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Tabline splits
let g:airline#extensions#tabline#show_splits = 1

" Tabline separators
let g:airline#extensions#tabline#left_sep = '█'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = '█'
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#buffer_idx_mode = 1

" Show just the filename, not the whole path
let g:airline#extensions#tabline#fnamemod = ':t'

" Disable whitespace detection
let g:airline#extensions#whitespace#enabled = 1
" ctags
inoremap <C-f> g<C-]>
nnoremap <C-f> g<C-]>

" fzf.vim
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>S :GFiles?<CR>
nnoremap <Leader>C :Commits<CR>
nnoremap <S-Tab> :Buffers<CR>

set t_Co=256
colors gruvbox
set background=dark


" minimap
let g:minimap_highlight='LineNr'

" dash
nnoremap <Leader>D :Dash<CR>

" indentline
" let g:indentLine_char = '┊'
let g:indentLine_char = '▏'

" coc.vim
autocmd FileType json syntax match Comment +\/\/.\+$+
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" airline config
let g:airline_theme = 'gruvbox'
let g:airline_focuslost_inactive = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.linenr = ''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'c'  : 'COM',
    \ 'i'  : 'INS',
    \ 'ic' : 'INS',
    \ 'ix' : 'INS',
    \ 'n'  : 'NOR',
    \ 'ni' : 'NOR',
    \ 'no' : 'NOR',
    \ 'R'  : 'REP',
    \ 'Rv' : 'REP',
    \ 's'  : 'SEL',
    \ 'S'  : 'SEL',
    \ '' : 'SEL',
    \ 't'  : 'T',
    \ 'v'  : 'VIS',
    \ 'V'  : 'VIS',
    \ '' : 'VIS',
    \ }

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Tabline splits
let g:airline#extensions#tabline#show_splits = 1

" Tabline separators
let g:airline#extensions#tabline#left_sep = '█'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = '█'
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#buffer_idx_mode = 1

" Show just the filename, not the whole path
let g:airline#extensions#tabline#fnamemod = ':t'

" Disable whitespace detection
let g:airline#extensions#whitespace#enabled = 1

