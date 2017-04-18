
" enable syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable " Enable syntax highlighting
endif

" install missing plugins
call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'myusuf3/numbers.vim'
	Plug 'Lokaltog/vim-powerline'
	Plug 'vim-syntastic/syntastic'
  Plug 'edkolev/tmuxline.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'altercation/vim-colors-solarized'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-sensible'
	Plug 'suan/vim-instant-markdown'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'myhere/vim-nodejs-complete'
	Plug 'othree/html5.vim'
call plug#end()

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" solarized config
colorscheme solarized
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:Powerline_symbols = 'fancy'
call togglebg#map("<F5>")

" general config
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set showtabline=2
set number
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
set nocompatible
set t_Co=256
set tabstop=2
set path+=**
set cursorline

" quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
filetype plugin indent on
syntax enable

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
map <C-o> :NERDTreeTabsToggle<CR>

" powerline config
set rtp+=/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.linenr = ''
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" buffer selector function
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

let g:airline_theme='base16_google'

" instant markdown config
" let g:instant_markdown_slow = 1

" tmuxline config
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
			\'z'    : '%R'}

