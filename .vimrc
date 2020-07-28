" Vim-Plug {{{1
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Make sure you use single quotes
" Initialize plugin system
call plug#end()

" General: Recommended Defaults {{{1
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

" General: Usability options {{{1
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
set cmdheight=1
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" General: Indentation options {{{1
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
 
" General: Copy Paste {{{1
" copy and paste to osx pastebuffer
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

" paste multiple times
xnoremap p pgvy

" General: Other/Personal {{{1

" folding for vimrc
set foldmethod=syntax
set foldlevel=99
set modelines=1

" Do not open folds during search
set fdo-=search

" syntax highlighting
syntax enable
set background=light
colorscheme solarized

"quick save with leader key 
noremap <Leader>s :update<CR>

" capitol w does lowercase w
command! W w

" Enable folding with the spacebar
nnoremap <space> zA

" Docstrings for folded code
let g:SimpylFold_docstring_preview=1

" etf8
set encoding=utf-8

" auto reload the file. If using tmux, see:
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
au CursorHold,CursorHoldI * checktime

" how many seconds to wait after cursorhold to checktime for updates
set updatetime=250

" do not require saving when changing buffers
set hidden

" faster switching of tabs
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" side scroll by 20 characters
set sidescroll=20

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
" use ripgrep for populating files
if executable('rg')
    let g:ctrlp_user_command = 'rg . ./vendor/github.com/quibitv/ --files --color=never --glob "*.go"'
endif

" searches only the filename, not path.
let g:ctrlp_by_filename = 0

" Golang {{{1
" 
" goimports
let g:go_fmt_command = "goimports"

" highlight function and method names
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1


" no wrap for golang
augroup WrapLineInTeXFile
    autocmd!
    autocmd FileType go setlocal nowrap
augroup END

" enable autolinter
let g:go_metalinter_autosave = 0

" use gopls language server protocol for godef
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_implements_mode = 'gopls'
let g:go_referrers_mode = 'gopls'

" location list is a quickfix list as well
let g:go_list_type = "quickfix"

" leader mappings for vim-go
autocmd FileType go nmap <leader>r  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
nnoremap <leader>q :cclose<CR>
nnoremap <leader>o :cprev<CR>
nnoremap <leader>p :cnext<CR>
nnoremap <leader>d :GoDeclsDir<CR>

" guru scope
autocmd BufRead ~/Work/go/src/github.com/quibitv/*.go
      \  let s:tmp = matchlist(expand('%:p'),
          \ '~/Work/go/src/\(github.com/quibitv/[^/]\+\)')
      \| if len(s:tmp) > 1 |  exe 'silent :GoGuruScope ' . s:tmp[1] | endif
      \| unlet s:tmp

" vim-go guru
noremap <Leader>i :GoImplements<CR>
noremap <Leader>c :GoCallees<CR>
noremap <Leader>r :GoReferrers<CR>
noremap <Leader>z :GoAlternate<CR>

" Use Coc.nvim over vim-go for certain actions
let g:go_def_mapping_enabled = 0



" Coc.nvim {{{1
"
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Ctrl-] (coc-definition)
nmap <silent> <C-]> <Plug>(coc-definition)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" NOTE: these break jump https://github.com/neoclide/coc.nvim/issues/1089
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" TODO: fix
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" NOTE: these don't work well with our fold shortcut being Space
" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"https://github.com/neoclide/coc.nvim/issues/856
let g:coc_node_path = '/usr/local/bin/node'

" ack.vim {{{1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" vim-gitgutter {{{1
"
" Fix colors for gutter bar on the left 
highlight clear SignColumn

" diff with master branch
let g:gitgutter_diff_base = 'main'

" fugitive {{{1
nnoremap <Leader>g :Gblame<Return>

" tagbar {{{1

" map \t to toggle tagbar
nmap <leader>t :TagbarToggle<CR>

" airline integration -- doesn't exactly work
let g:airline#extensions#tagbar#enabled = 1

" airline {{{1
let g:airline_theme='solarized'


" NerdTree {{{1
map <C-n> :NERDTreeToggle<CR>

" golang-ci vim-go {{{1
" Fix issue: https://github.com/fatih/vim-go/issues/2305
let g:go_metalinter_command='golangci-lint run --print-issued-lines=false'
nnoremap <Leader>l :GoMetaLinter<Return>

" autorun GoMetaLinter
let g:go_metalinter_autosave = 0

" QuickFix Window {{{1
" Auto-adjust quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
" https://gist.github.com/juanpabloaj/5845848
" FOLDING FOR VIMRC. LEAVE AT LAST LINE OF VIMRC {{{1
" vim:foldmethod=marker:foldlevel=0
