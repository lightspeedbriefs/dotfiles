call plug#begin('~/.vim/bundle')

" Code completion engine
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}

" Syntax checker
Plug 'scrooloose/syntastic'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Pull C++ function prototypes from headers into implementation files
Plug 'derekwyatt/vim-protodef'

" Browse tags for the current file to get an overview of its structure in a sidebar
Plug 'majutsushi/tagbar'

Plug 'ervandew/supertab'

" Nice start screen when vim is opened with no args
Plug 'mhinz/vim-startify'

" Graph your undo tree
Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'

" Buffer, file, tab, workspace, bookmark fuzzy search
Plug 'vim-ctrlspace/vim-ctrlspace'

" Fuzzy file, buffer, mru, tag, etc. finder
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim'

" Align statements such as assignments
Plug 'junegunn/vim-easy-align'

" Regenerate tags files while you work
Plug 'ludovicchabant/vim-gutentags'

" Place, toggle, and display marks
Plug 'kshenoy/vim-signature'

" Correct common misspellings and typos
Plug 'chip/vim-fat-finger'

" File navigation tree window
Plug 'scrooloose/nerdtree'

" Show git status symbols in the nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Read man pages in vim
Plug 'nhooyr/neoman.vim'

" Read devdocs in vim
Plug 'rhysd/devdocs.vim'

" VCS plugins

" Git wrapper
Plug 'tpope/vim-fugitive'

" Show differences
Plug 'mhinz/vim-signify'

" Show a git diff in the gutter (sign column) and stage/revert hunks.
Plug 'airblade/vim-gitgutter'

" silver searcher plugin
Plug 'mileszs/ack.vim'

" ack.vim alternative
Plug 'dyng/ctrlsf.vim'

" grepper
Plug 'mhinz/vim-grepper'

" Incremental search highlighting of all hits
Plug 'haya14busa/incsearch.vim'

" Commenting plugins

Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'

" Motion Plugins

" Generate shortcuts using 's'
Plug 'justinmk/vim-sneak'

" Highlight targets for character motions ('f', 'F', 't', 'T', ';', ',')
Plug 'unblevable/quick-scope'

" Generate ultra-fast shortcuts to move anywhere
Plug 'easymotion/vim-easymotion'

" Switch between source and header (alternatives to this include a.vim and fswitch)
Plug 'kana/vim-altr'

" Open file:line:col
Plug 'kopischke/vim-fetch'

" Run google test framework unit tests within vim
Plug 'alepez/vim-gtest'

" Look up documentation for by pressing gK
Plug 'keith/investigate.vim'

" protodef depends on fswitch
Plug 'derekwyatt/vim-fswitch'

" Run a terminal from within vim
Plug 'vim-scripts/Conque-Shell'

" Manipulate gists directly from vim
Plug 'lambdalisue/vim-gista'

" Execute all or part of the current file you're editing
Plug 'thinca/vim-quickrun'

" Open a link by pressing 'gx' on it, or search a word or phrase by pressing 'gx' on it
Plug 'tyru/open-browser.vim'

" Create an awesome status line
Plug 'vim-airline/vim-airline'

" Generate a shell prompt from airline config
Plug 'edkolev/promptline.vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimshell.vim'
Plug 'alx741/vinfo'
Plug 'junegunn/vim-peekaboo'
Plug 'lfv89/vim-interestingwords'
Plug 'gorkunov/smartpairs.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Themes
Plug 'AlessandroYorba/Alduin'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'baskerville/bubblegum'
Plug 'romainl/Apprentice'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ryanoasis/vim-devicons'
Plug 'koron/nyancat-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" Insert snippets (engine only)
Plug 'SirVer/ultisnips'

call plug#end()

set nocompatible
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showmatch
set incsearch
set title
set virtualedit=all
set hlsearch
set hidden
set wildmode=list:longest,full
set wildignore=*.o,*.d,*.so,*.a,*.bin,*.pyc
set cursorline
set clipboard=unnamedplus
set winwidth=85
set nowrap
map <F1> :bp<CR>
map <F2> :bn<CR>
map <F3> :b#<CR>
map <F4> :FSHere<CR>
map <F5> :YcmCompleter GoToInclude<CR>
map <F6> :NERDTreeToggle<CR>
map <F7> :UndotreeToggle<CR>
set pastetoggle=<F8>
nmap <F9> <Plug>(altr-forward)
nmap <S-F9> <Plug>(altr-back)
map <F10> :lop<CR>
map <S-F10> :lcl<CR>
map <F11> :TagbarToggle<CR>
map <F12> :GundoToggle<CR>
" workaround for NERDTree making bd close vim http://stackoverflow.com/a/16505009
nnoremap <leader>bd :bp<cr>:bd #<cr>
nnoremap <leader>ac :Ack --cc "\b<cword>\b"<cr>
nnoremap <leader>ax :Ack --cpp "\b<cword>\b"<cr>
nnoremap <leader>sc :execute 'CtrlSF -filetype cc \b' . expand("<cword>") . '\b'<cr>:set filetype=c<cr>
nnoremap <leader>sx :execute 'CtrlSF -filetype cpp \b' . expand("<cword>") . '\b'<cr>:set filetype=cpp<cr>
nnoremap <C-Bslash> :CtrlPBuffer<cr>

let g:FindFileIgnore = ['*.o', '*.d', '*.a', '*.so', '*.pyc']
let g:ConqueTerm_CloseOnEnd = 1
" Mark plugin config
" Mark plugin may be found at http://www.vim.org/scripts/script.php?script_id=2666
let g:mwIgnoreCase = 0
let g:mwAutoLoadMarks = 1
let g:mwDefaultHighlightingPalette = 'extended'
" multiple-cursors config
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-y>'
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let [&nu, &rnu] = [&nu+&rnu==0, &nu]
map <silent> <C-l> :setl <C-R>=&rnu ? "nornu" : "rnu"<CR><CR>
map <silent> <C-n> :set invhlsearch<CR>
map <silent> <C-m> :set invspell<CR>
map <silent> <C-h> :MarkClear<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>
nnoremap <silent> <C-Left> :wincmd h<CR>
nnoremap <silent> <C-Up> :wincmd k<CR>
nnoremap <silent> <C-Down> :wincmd j<CR>
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" QuickScope config
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)
" signify config
let g:signify_vcs_list = [ 'git' ]
" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_cpp_checkers = []
let g:syntastic_c_checkers = []
let g:ycm_always_populate_location_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++14 -Wall -Wextra'
" openbrowser config
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" easyalign config
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
set backspace=indent,eol,start
set tags=tags;/
syntax on
set background=dark
set titlestring=[%{hostname()}]\ vim(%{expand(\"%\")})\ %h%r%m
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number of lines to save for undo on a buffer reload
"set spell
set viminfo+=!  " Save and restore global variables
set number
set foldmethod=syntax
set foldcolumn=1
set linebreak
set laststatus=2
set cino+=g0
set cino+=N-s
set cino+=l1
set t_ZH=[3m
set t_ZR=[23m
set path+=/usr/local/include
set formatoptions+=n
set matchpairs+=<:>
let g:is_bash = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"
let g:airline_powerline_fonts = 1
"let g:airline_theme='apprentice'
let g:airline_theme='PaperColor'
"let g:airline_theme='tomorrow'
colorscheme PaperColor
"colorscheme apprentice
"colorscheme Tomorrow-Night
"hi clear CursorLine " need CursorLine highlighted for ctrlp
highlight SpellBad ctermbg=none cterm=underline
highlight SpellCap ctermbg=none cterm=underline
highlight SpellLocal ctermbg=none cterm=underline
highlight SpellRare ctermbg=none cterm=underline

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  SignatureToggleSigns
  normal mZ
  %s/\s\+$//e
  normal `Z
  normal dmZ
  SignatureToggleSigns
endfunction
autocmd BufWritePre Makefile,*.inc,*.mk,*.c,*.cpp,*.h,*.hpp,*.pl,*.pm,*.sh,*.rb,*.py,*.xml,*.gradle,.vimrc,.bashrc,.bash_profile,.zshrc,.gitconfig :call StripTrailingWhitespace()
autocmd BufWritePre Makefile,*.inc,*.mk,*.c,*.cpp,*.h,*.hpp,*.pl,*.pm,*.sh,*.rb,*.py,*.xml,*.gradle,.vimrc,.bashrc,.bash_profile,.zshrc,.gitconfig retab
"autocmd VimEnter * FC .
autocmd BufWinEnter * normal zR

" ctrlp config
let g:ctrlp_user_command = 'find %s -regextype egrep -type f -regex ".*\.(cpp|h|hpp)"'
let g:ctrlp_by_filename = 1
let g:ctrlp_reuse_window = 'startify'
let g:startify_change_to_dir = 0

" Switch to the file and load it into the current window >
nmap <silent> <Leader>of :FSHere<cr>
" Switch to the file and load it into the window on the right >
nmap <silent> <Leader>ol :FSRight<cr>
" Switch to the file and load it into a new window split on the right >
nmap <silent> <Leader>oL :FSSplitRight<cr>
" Switch to the file and load it into the window on the left >
nmap <silent> <Leader>oh :FSLeft<cr>
" Switch to the file and load it into a new window split on the left >
nmap <silent> <Leader>oH :FSSplitLeft<cr>
" Switch to the file and load it into the window above >
nmap <silent> <Leader>ok :FSAbove<cr>
" Switch to the file and load it into a new window split above >
nmap <silent> <Leader>oK :FSSplitAbove<cr>
" Switch to the file and load it into the window below >
nmap <silent> <Leader>oj :FSBelow<cr>
" Switch to the file and load it into a new window split below >
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

let g:ycm_confirm_extra_conf = 0

" tagbar config
let g:tagbar_show_linenumbers = -1
autocmd BufEnter * nested :call tagbar#autoopen(0)

" NERDTree config
let NERDTreeIgnore = ['\.o$', '\.a$', '\.bin$', '\~$']
let NERDTreeWinSize = 40
let NERDTreeQuitOnOpen = 1

autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ | endif

function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

" ack/silver searcher config
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ctrlsf config
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
let g:ctrlsf_winsize = '35%'
let g:ctrlsf_regex_pattern = 1

" vim-gtest config

augroup GTest
    autocmd FileType cpp nnoremap <silent> <leader>tt :GTestRun<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tu :GTestRunUnderCursor<CR>
    autocmd FileType cpp nnoremap          <leader>tc :GTestCase<space>
    autocmd FileType cpp nnoremap          <leader>tn :GTestName<space>
    autocmd FileType cpp nnoremap <silent> <leader>te :GTestToggleEnabled<CR>
    autocmd FileType cpp nnoremap <silent> ]T         :GTestNext<CR>
    autocmd FileType cpp nnoremap <silent> [T         :GTestPrev<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tf :CtrlPGTest<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tj :GTestJump<CR>
    autocmd FileType cpp nnoremap          <leader>ti :GTestNewTest<CR>i
augroup END

autocmd FileType startify setlocal buftype=
