set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
syn enable
colorscheme morning
set nowrap
"set background=dark

":setlocal spell spelllang=en_us
" let Vundle manage Vundle
" required! 
 autocmd FileType c,java,javascript inoreabbrev <buffer> /** /**<CR>/<Up>
filetype plugin on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'AutomaticLaTeXPlugin'
Plugin 'LaTeX-error-filter'
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" a Git wrapper so awesome, it should be illegal
    " https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'
" A vim plugin to display the indention levels with thin vertical lines
    " https://github.com/Yggdroot/indentLine
 Plugin 'Yggdroot/indentLine'
" A code-completion engine for Vim
    " https://github.com/Valloric/YouCompleteMe
        let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
				let g:indentLine_enabled=1
" Vim plugin that displays tags in a window, ordered by scope
    " https://github.com/majutsushi/tagbar
    Plugin 'majutsushi/tagbar'
    nmap <leader>t :TagbarToggle<CR>

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
set showmatch
set hlsearch
set nowrap 
set tw=95
set nospell
setlocal fo-=ro fo+=cql
filetype plugin indent on     " required!
set secure
