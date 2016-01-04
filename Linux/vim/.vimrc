" vimrc configuration file

set nocompatible               " be iMproved
filetype off                   " required!
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
	

" Syntax/Languge Plugins
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
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

"Syntastic Configurations
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" show the 'best match so far' as search strings are typed:
set incsearch

" Indicates a fast terminal connection.  More characters will be sent to
" the screen for redrawing, instead of using insert/delete line
" commands.  Improves smoothness of redrawing when there are multiple
" windows and the terminal does not support a scrolling region.
set ttyfast

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
