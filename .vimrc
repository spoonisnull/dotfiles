" load plugins
execute pathogen#infect()

" general
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set showtabline=2
set cursorline
set number
"set colorcolumn=80
set encoding=utf-8
set wildmenu
set showcmd
set ignorecase
set smartcase
set incsearch
set hlsearch
set autoindent
set smartindent
set noerrorbells
set visualbell
set mouse=a
set lazyredraw
set showmatch
set foldenable
set foldlevelstart=10
set autoread
set hidden

" quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
filetype plugin indent on
syntax enable

" buffer management
map <C-h> :bp <CR>
map <C-l> :bn <CR>

" move lines mapping on Ctrl+hjkl
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

" nerd tree
autocmd StdinReadPre * let s:std_in=1
map <C-o> :NERDTreeTabsToggle<CR>

" powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" airline
let g:airline_theme='solarized'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" solarized
set background=dark
colorscheme solarized
let g:Powerline_symbols = 'fancy'
call togglebg#map("<F5>")


