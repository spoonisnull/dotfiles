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
	Plug 'dominikduda/vim_current_word'
  Plug 'shougo/neocomplete.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'flazz/vim-colorschemes'
	Plug 'chriskempson/base16-vim'
call plug#end()

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

let base16colorspace=256
colorscheme base16-default-dark

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
"set cursorline
" quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
filetype plugin indent on

" format json
nnoremap <C-f> :%!python -m json.tool

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

" airline config
let g:airline_theme='base16_shell'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
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
" let g:instant_markdown_slow = 1

" tmuxline config
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
			\'z'    : '%R'}

" neocomplete config
let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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

