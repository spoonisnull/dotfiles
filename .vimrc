syntax enable

" install missing plugins
call plug#begin('~/.vim/plugged')
  Plug 'edkolev/tmuxline.vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'lokaltog/vim-powerline'
  Plug 'myhere/vim-nodejs-complete'
  Plug 'myusuf3/numbers.vim'
  Plug 'othree/html5.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'suan/vim-instant-markdown'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-syntastic/syntastic'
  Plug 'scrooloose/nerdtree'
call plug#end()

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" general config
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set foldenable
set foldlevelstart=10
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set nocompatible
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
set t_Co=256
set tabstop=2
set visualbell
set wildmenu

" share system clipboard and unnamed reg
set clipboard=unnamedplus

" set horizontal line highlighting
set cursorline
hi CursorLine none
hi CursorLine ctermbg=black ctermfg=none
hi LineNr ctermbg=black ctermfg=darkred

" set vertical line highlighting
" set cursorcolumn
" hi CursorColumn ctermbg=black ctermfg=none

" quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
filetype plugin on

" leader config
let mapleader = " "
nmap <leader>n :tabnew<Enter>
nmap <leader>l :tabnext<Enter>
nmap <leader>h :tabprev<Enter>


" movement config
" one line up/down regardless of wrapping
nnoremap j gj
nnoremap k gk

" format json
nnoremap <leader><C-f> :%!python -m json.tool

" move lines mapping on Ctrl+hjkl
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerd tree config
autocmd StdinReadPre * let s:std_in=1
nnoremap <leader>o :NERDTreeTabsToggle<CR>

" powerline config
"set rtp+=/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim

" airline config
let g:airline_theme = 'base16_eighties'
let g:airline_powerline_fonts=1

" airline symbols - classic or no symbols
"let g:airline_left_sep = ''
let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.linenr = ''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1 

" Show just the filename, not the whole path
let g:airline#extensions#tabline#fnamemod = ':t'

" Disable whitespace detection
let g:airline#extensions#whitespace#enabled = 0

" Remove colour highlighting on section_z
let g:airline_section_warning = ''
let g:airline_section_error = ''

" instant markdown config
let g:instant_markdown_slow = 1

" tmuxline config
let g:tmuxline_preset = {
  \'a'    : '#S',
  \'win'  : '#I #W',
  \'cwin' : '#I #W',
  \'z'    : '%R'}

" use no special powerline symbols in tmuxline ~ reaches out to tmux in shell
let g:tmuxline_powerline_separators = 0

" Fuzzy buffer selector function
function! FuzzyBufferSelect(pattern)
  let buffercount = bufnr("$")
  let currentbuffernumber = 1
  let numberofmatches = 0
  let firsmatchingbuffernumber = 0
  while currentbuffernumber <= buffercount
    if(bufexists(currentbuffernumber))
      let currentbuffername = bufname(currentbuffernumber)
      if(match(currentbuffername, a:pattern) > -1)
        echo currentbuffernumber . ": ". bufname(currentbuffernumber)
        let numberofmatches += 1
        let firstmatchingbuffernumber = currentbuffernumber
      endif
    endif
    let currentbuffernumber = currentbuffernumber + 1
  endwhile
  if(numberofmatches == 1)
    execute ":buffer ". firstmatchingbuffernumber
  elseif(numberofmatches > 1)
    let desiredbuffernumber = input("Enter buffer number: ")
    if(strlen(desiredbuffernumber) != 0)
      execute ":buffer ". desiredbuffernumber
    endif
  else
    echo "No matching buffers."
  endif
endfunction

" binding for FuzzyBufferSelect
command! -nargs=1 B :call FuzzyBufferSelect("<args>")

