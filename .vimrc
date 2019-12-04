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

" PLUGINS
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
  " Plug 'neoclide/coc.nvim', {'do': './install.sh nightlyll/undotree'}
  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/goyo.vim'
  Plug 'jremmen/vim-ripgrep'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'gcavallanti/vim-noscrollbar'
  Plug 'edkolev/tmuxline.vim'
  Plug 'whiteinge/diffconflicts'
call plug#end()

let mapleader = " "

" SETTINGS
set cursorline
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
set scrolloff=3
set directory^=$HOME/.vim/tmp//
set termguicolors
set shortmess+=A
set undofile
" set foldcolumn=5
set inccommand=nosplit
set list lcs=trail:·,tab:»·
set t_Co=256
colors gruvbox
" set background=light
set background=dark

" MARKDOWN
" let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_browser='Safari'
let vim_markdown_preview_github=1

" GITGUTTER
let g:gitgutter_override_sign_column_highlight = 1
hi SignColumn ctermbg=black ctermfg=darkred
hi GitGutterAdd ctermbg=black ctermfg=darkgreen
hi GitGutterChange ctermbg=black ctermfg=darkyellow
hi GitGutterDelete ctermbg=black ctermfg=darkred
hi GitGutterChangeDelete ctermbg=black ctermfg=darkred

let g:SnazzyTransparent = 1

" MAPPINGS

map <C-t> :tab split<CR>
" open in new tab
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" ignore wrap when using a count
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" ignore wrap when using a count
nnoremap Q @@
" repeat last macro
nnoremap <Tab> :bn<CR>
" navigate buffs
nnoremap <S-Tab> :bp<CR>
" navigate buffs
nnoremap <C-j> :m .+1<CR>==
" move lines
nnoremap <C-k> :m .-2<CR>==
" move lines
nnoremap <Leader>e :e 
" edit file
nnoremap <Leader>w :w<CR>
" write file
nnoremap <Leader>r :source $MYVIMRC<CR>
" reload vimrc
nnoremap <Leader>h <C-w>h<CR>k
" navigate windows
nnoremap <Leader>l <C-w>l<CR>k
" navigate windows
nnoremap <Leader>j <C-w>j<CR>k
" navigate windows
nnoremap <Leader>k <C-w>k<CR>k
" navigate windows
nnoremap <Leader>x :bd!<CR>
" discard buff
nnoremap <Leader>n :noh<CR>
" unhighlight
nnoremap <Leader>F :%!python -m json.tool<CR>
" pretty format JSON
nnoremap <Leader>wq :wq<CR>
" save file and quit
nnoremap <Leader>q :q<CR>
" quit
nnoremap <Leader>v :e $MYVIMRC<CR>
" open vimrc
nnoremap <Leader>g :GitGutterToggle<CR>
" enabgle gitgutter
nnoremap <Leader>J Lzz
" scroll down
nnoremap <Leader>K Hzz
" scroll up
nnoremap <Leader>d :Gdiff<CR>

nnoremap <Leader>D :DiffConflicts<CR>
" fug diff
nnoremap <Leader>s :Gstatus<CR>
" fug status
nnoremap <Leader>b :Gblame<CR>
" fug blame
nnoremap <Leader>G :Ggrep
" fug git grep
nnoremap <Leader>o :NERDTreeToggle<CR>
" nerdtree
nnoremap <C-f> g<C-]>
" find ctag
nnoremap <Leader>f :Files<CR>
" open fzf
nnoremap <Leader>S :GFiles?<CR>
" fzf git status
nnoremap <Leader>C :Commits<CR>
" fzf git commits
nnoremap <A-Tab> :Buffers<CR>
" fzf buffs
nnoremap <Leader>D :Goyo<CR>
" enable distraction-free mode
nnoremap <Leader><Leader> <C-w><C-w>
" switch between quickfix and main
nnoremap <Leader>m :marks<CR>
" Ctrl-P
nnoremap <Leader>p :CtrlP<CR>

inoremap <C-j> <Esc>:m .+1<CR>==gi
" move lines
inoremap <C-k> <Esc>:m .-2<CR>==gi
" move lines
inoremap <C-f> g<C-]>
" find ctag
nnoremap <Leader>! i#!/usr/bin/env bash<Esc>0o<Esc>j
" insert shebang

vnoremap <silent> <leader>c :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
" copy selection to system clipboard
vnoremap <C-j> :m '>+1<CR>gv=gv
" move lines
vnoremap <C-k> :m '<-2<CR>gv=gv
" move lines

autocmd QuickFixCmdPost *grep* cwindow

" NERDTREE
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
 \ "Modified"  : "✹",
 \ "Staged" : "✚",
 \ "Untracked" : "✭",
 \ "Renamed": "➜",
 \ "Unmerged"  : "═",
 \ "Deleted": "✖",
 \ "Dirty"  : "✗",
 \ "Clean"  : "✔︎",
 \ 'Ignored': '☒',
 \ "Unknown": "?"
\ }

" COC.VIM
autocmd FileType json syntax match Comment +\/\/.\+$+
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
"
" suggest down
inoremap <silent><expr> <C-Space>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()

" suggest up
inoremap <silent><expr> <S-Space>
\ pumvisible() ? "\<C-p>" :
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()

" AIRLINE
let g:airline_theme = 'gruvbox'
let g:airline_focuslost_inactive = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 12
let g:airline#extensions#tabline#left_sep = "\ue0b0 "
let g:airline#extensions#tabline#left_alt_sep = "\ue0b1"
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
 \ '' : 'VIB',
 \ }

" INDENTLINE
let g:indentLine_char = '¦'
" let g:indentLine_first_char = ' '
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = ' '
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setConceal = 0
" let g:indentLine_conceallevel = 3

" DEVICON
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" VIM-RIPGREP
let g:rg_command = 'rg --vimgrep -S'

" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{noscrollbar#statusline()}

function! Noscrollbar(...)
    let w:airline_section_z = '%{noscrollbar#statusline(10,"■","◫",["◧"],["◨"])}'
endfunction
call airline#add_statusline_func('Noscrollbar')

" TMUXLINE
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '%a %d/%m',
      \'z'    : '%R'}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
