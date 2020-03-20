" Vim-Plug {{{1
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tmux-plugins/vim-tmux-focus-events'
" YCM REQUIRES: python3 -m pip install --user --upgrade pynvim
Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'preservim/nerdtree'

" Make sure you use single quotes
" Initialize plugin system
call plug#end()

" Custom {{{1

" folding for vimrc
set foldmethod=syntax
set foldlevel=99
set modelines=1

" syntax highlighting
syntax enable
set background=light
colorscheme solarized

"quick save with leader key 
noremap <Leader>s :update<CR>

" capitol w does lowercase w
command! W w

" Enable folding with the spacebar
nnoremap <space> za

" Docstrings for folded code
let g:SimpylFold_docstring_preview=1

" etf8
set encoding=utf-8

" auto reload the file. If using tmux, see:
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
au CursorHold,CursorHoldI * checktime

" how many seconds to wait after cursorhold to checktime for updates
set updatetime=250


" Generally Recommended Defaults {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Enable indenting based on indent file stored in ~/.vim/indent/*
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
" Highlight while typing search query
set hlsearch
"------------------------------------------------------------
"
" These are highly recommended options.
 
" :e ~/.vim<TAB>. Command line completion. Provide a graphical menu of all matches.
set wildmenu
 
" Show commands being typed in the bottom right corner of screen
set showcmd
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set tabstop=4
 
" Copy Paste {{{1
"
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

" paste multiple times
xnoremap p pgvy

" ctrlp {{{1
"
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_open_multiple_files = '10i'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" use current path to preppopulate
let g:ctrlp_working_path_mode = 'r'

" let g:ctrlp_user_command = 'find %s -type f -name "*.go"'
" use ripgrep for searching
if executable('rg')
    let g:ctrlp_user_command = 'rg . ./vendor/github.com/quibitv/ --files --color=never --glob "*.go"'
endif

" if executable('rg')
"     let g:ctrlp_user_command = 'rg ./search/ ./vendor/github.com/quibitv/search/ --files --color=never --glob "*.go"'
" endif


" Golang {{{1
" goimports
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1

" golang lint
" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autolint?
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" highlight function and method names
let g:go_highlight_functions = 1

" vim-go guru
noremap <Leader>i :GoImplements<CR>
noremap <Leader>c :GoCallees<CR>
noremap <Leader>r :GoReferrers<CR>
noremap <Leader>z :GoAlternate<CR>

" no wrap for golang
augroup WrapLineInTeXFile
    autocmd!
    autocmd FileType go setlocal nowrap
augroup END


" stop autolinter
let g:go_metalinter_autosave = 0


" load vimrc to any window that writes to a file
autocmd BufWritePost .vimrc,_vimrc source $MYVIMRC

" use gopls language server protocol for godef
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" default scope for godef
"let g:go_guru_scope = ["."]

" YCM and tags {{{1

" map \jd to GoTo
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" map \t to toggle tagbar
nmap <leader>t :TagbarToggle<CR>

" turn ycm off
let g:ycm_show_diagnostics_ui = 1
" ack.vim {{{1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" fugitive {{{1
nnoremap <Leader>g :Gblame<Return>

" Utlisnips + YCM {{{1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NerdTree {{{1
map <C-n> :NERDTreeToggle<CR>

" FOLDING FOR VIMRC. LEAVE AT LAST LINE OF VIMRC {{{1
" vim:foldmethod=marker:foldlevel=0
