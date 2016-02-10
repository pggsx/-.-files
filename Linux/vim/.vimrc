" vimrc configuration file

set nocompatible               " be iMproved
filetype plugin on             " required!
call plug#begin('~/.vim/bundle')
syn enable
colorscheme morning
set nowrap
set wildmenu
set wildmode=list:longest,full
"auto-gen block comments
autocmd FileType c,java,javascript inoreabbrev <buffer> /** /**<CR>/<Up>

"IDE Plugins


Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye'
Plug 'edkolev/tmuxline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'wookiehangover/jshint.vim'
Plug 'Raimondi/delimitMate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'



" Syntax/Languge Plugins
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'Chiel92/vim-autoformat'
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
" a Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" A vim plugin to display the indention levels with thin vertical lines
" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'
" A code-completion engine for Vim
" https://github.com/Valloric/YouCompleteMe
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:indentLine_enabled=1
" Vim plugin that displays tags in a window, ordered by scope
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>
"LaTeX Plugins
Plug 'LaTeX-error-filter'
Plug 'lervag/vimtex'
call plug#end()
filetype plugin on

"Airline Configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:tmuxline_preset = 'nightly_fox'
set laststatus=2
let g:tmuxline_preset = 'full'

"Syntastic Configurations
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:airline#extensions#tabline#enabled = 1
let g:javascript_enable_domhtmlcss =1
let b:javascript_fold =1
" show the 'best match so far' as search strings are typed:
set incsearch

" Indicates a fast terminal connection.  More characters will be sent to
" the screen for redrawing, instead of using insert/delete line
" commands.  Improves smoothness of redrawing when there are multiple
" windows and the terminal does not support a scrolling region.
set ttyfast


"Enabled YCM (YouCompleteMe IDE)
let g:enable_ycm_at_startup = 0


"Auto-Generating FileType Templates
"C Source Files
autocmd bufnewfile *.c so ~/.vim/temp/c_temp.txt
autocmd bufnewfile *.c exe "3," . 12 . "g/File Name:/s//File Name: " .expand("%")
autocmd bufnewfile *.c exe "3," . 12 . "g/Creation Date:/s//Creation Date: " .strftime("%d-%m-%y")
autocmd bufwritepre,filewritepre *.c execute "normal ma"
autocmd bufwritepre,filewritepre *.h exe "3," . 12 . "g/Last Modified:/s/.*/\tLast Modified: " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

"C Header Files
autocmd bufnewfile *.h so ~/.vim/temp/c_temp.txt
autocmd bufnewfile *.h exe "3," . 12 . "g/File Name:/s//File Name : " .expand("%")
autocmd bufnewfile *.h exe "3," . 12 . "g/Creation Date:/s//Creation Date: " .strftime("%d-%m-%y")
autocmd bufwritepre,filewritepre *.h execute "normal ma"
autocmd bufwritepre,filewritepre *.h exe "3," . 12 . "g/Last Modified:/s/.*/\tLast Modified: " .strftime("%c")
autocmd bufwritepost,filewritepost *.h execute "normal `a"

" Go Source Files
autocmd bufnewfile *.go so ~/.vim/temp/go_temp.txt
autocmd bufnewfile *.go exe "3," . 12 . "g/File Name:/s//File Name : " .expand("%")
autocmd bufnewfile *.go exe "3," . 12 . "g/Creation Date:/s//Creation Date: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.go execute "normal ma"
autocmd bufwritepre,filewritepre *.go exe "3," . 12 . "g/Last Modified:/s/.*/\tLast Modified: " .strftime("%c")
autocmd bufwritepost,filewritepost *.go execute "normal `a"


" HTML Source Files
autocmd bufnewfile *.html so /home/pavan/.vim/temp/html.txt


"Javascript Source Files
autocmd bufnewfile *.js so /home/pavan/.vim/temp/js.txt
autocmd bufnewfile *.js exe "3," . 12 . "g/File Name:/s//File Name : " .expand("%")
autocmd bufnewfile *.js exe "3," . 12 . "g/Creation Date:/s//Creation Date: " .strftime("%d-%m-%y")
autocmd bufwritepre,filewritepre *.js  execute "normal ma"
autocmd bufwritepre,filewritepre *.js exe "3," . 12 . "g/Last Modified:/s/.*/\tLast Modified: " .strftime("%c")
autocmd bufwritepost,filewritepost *.js  execute "normal `a"


"Vim-Indent/GNU indent configuration
autocmd BufWritePost *.c !indent <afile>
autocmd BufWrite * :Autoformat <CR> 

" Go syntax hi-lighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"go import auto-formatting
let g:go_fmt_command = "goimports"

"Go plug mappings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)


" generate doc comment template

function! GenerateDOCComment()
	let l    = line('.')
	let i    = indent(l)
	let pre  = repeat(' ',i)
	let text = getline(l)
	let params   = matchstr(text,'([^)]*)')
	let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
	echomsg params
	let vars = []
	let m    = ' '
	let ml = matchlist(params,paramPat)
	while ml!=[]
		let [_,var;rest]= ml
		let vars += [pre.' * @param '.var]
		let ml = matchlist(rest,paramPat,0)
	endwhile
	let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
	call append(l-1,comment)
	call cursor(l+1,i+3)
endfunction

map kk :call GenerateDOCComment()<CR>

"GNU-Coding Standards
setlocal cindent
setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=79
set colorcolumn=79
highlight ColorColumn ctermbg=1
set nu
set tabstop=2
set hlsearch

" Make searches case-insensitive, unless they contain upper-case
set ignorecase
set smartcase

" Matching braces and visual line-wrapping
set showmatch
set nowrap

set tw=95
setlocal fo-=ro fo+=cql
" Turn off spellcheck by default
if has ('spell')
	set nospell
endif

" Other settings
set title           "Show the terminal title if possible"
set autowrite       "Save the buffer when performing commands"
set scrolloff=3     "Save three lines above and below"

"*******************************************************************
" Programming Specific Settings - (Syntax, Plugins, Features, etc.)
"*******************************************************************

" cscope and ctags integration
if has("cscope")
	set cscopetag cscopeverbose

	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	set csto=0

	cnoreabbrev csa cs add
	cnoreabbrev csf cs find
	cnoreabbrev csk cs kill
	cnoreabbrev csr cs reset
	cnoreabbrev css cs show
	cnoreabbrev csh cs help

	" emulates 'find the ctags' file for cscope
	function! LoadCscope()
		let db = findfile("cscope.out", ".;")
		if (!empty(db))
			let path = strpart(db, 0, match(db, "/cscope.out$"))
			set nocscopeverbose " suppress 'duplicate connection' error
			exe "cs add " . db . " " . path
			set cscopeverbose
		endif
	endfunction
	call LoadCscope()
endif

" ctags
set tags=./tags;/
filetype plugin indent on     " required!
set secure
