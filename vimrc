execute pathogen#infect()

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin managers
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-pathogen'
Plugin 'junegunn/vim-plug'

" Place, toggle, and display marks
Plugin 'kshenoy/vim-signature'

" Correct common misspellings and typos
Plugin 'chip/vim-fat-finger'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'

" Nice start screen when vim is opened with no args
Plugin 'mhinz/vim-startify'

" Graph your undo tree
Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'

" Buffer, file, tab, workspace, bookmark fuzzy search
Plugin 'vim-ctrlspace/vim-ctrlspace'

" Fuzzy file, buffer, mru, tag, etc. finder
Plugin 'ctrlpvim/ctrlp.vim'

" Align statements such as assignments
Plugin 'junegunn/vim-easy-align'

" Regenerate tags files while you work
Plugin 'ludovicchabant/vim-gutentags'

" Browse tags for the current file to get an overview of its structure in a sidebar
Plugin 'majutsushi/tagbar'

Plugin 'ervandew/supertab'

" Code completion engine
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

" Syntax checker
Plugin 'scrooloose/syntastic'

" Insert snippets (engine only)
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Pull C++ function prototypes from headers into implementation files
Plugin 'derekwyatt/vim-protodef'

" protodef depends on fswitch
Plugin 'derekwyatt/vim-fswitch'

" Run a terminal from within vim
Plugin 'vim-scripts/Conque-Shell'

" Manipulate gists directly from vim
Plugin 'lambdalisue/vim-gista'

" Execute all or part of the current file you're editing
Plugin 'thinca/vim-quickrun'

" Open a link by pressing 'gx' on it, or search a word or phrase by pressing 'gx' on it
Plugin 'tyru/open-browser.vim'

" Create an awesome status line
Plugin 'vim-airline/vim-airline'

" Generate a shell prompt from airline config
Plugin 'edkolev/promptline.vim'

" File navigation tree window
Plugin 'scrooloose/nerdtree'

" VCS plugins

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Show differences
Plugin 'mhinz/vim-signify'

" Show a git diff in the gutter (sign column) and stage/revert hunks.
Plugin 'airblade/vim-gitgutter'

" Commenting plugins

Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim'

" Motion Plugins

" Generate shortcuts using 's'
Plugin 'justinmk/vim-sneak'

" Highlight targets for character motions ('f', 'F', 't', 'T', ';', ',')
Plugin 'unblevable/quick-scope'

" Generate ultra-fast shortcuts to move anywhere
Plugin 'easymotion/vim-easymotion'

" Switch between source and header (alternatives to this include a.vim and fswitch)
Plugin 'kana/vim-altr'

" Open file:line:col
Plugin 'bogado/file-line'

" Themes
Plugin 'AlessandroYorba/Alduin'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'baskerville/bubblegum'
Plugin 'romainl/Apprentice'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end() " required

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
set incsearch
set hidden
set wildmode=list:longest,full
set wildignore=*.o,*.so,*.bin
map <F1> :bp<CR>
map <F2> :bn<CR>
map <F3> :b#<CR>
map <F4> :FSHere<CR>
map <F5> :YcmCompleter GoToInclude<CR>
map <F6> :NERDTreeToggle<CR>
map <F7> :UndoTreeToggle<CR>
set pastetoggle=<F8>
nmap <F9> <Plug>(altr-forward)
nmap <S-F9> <Plug>(altr-back)
map <F10> :lop<CR>
map <S-F10> :lcl<CR>
map <F11> :TagbarToggle<CR>
map <F12> :GundoToggle<CR>
" workaround for NERDTree making bd close vim http://stackoverflow.com/a/16505009
nnoremap <leader>bd :bp<cr>:bd #<cr>

let g:FindFileIgnore = ['*.o', '*.d']
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
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='apprentice'
abbreviate #i #include
abbreviate #d #define
colorscheme apprentice
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
autocmd BufWritePre Makefile,*.inc,*.mk,*.c,*.cpp,*.h,*.pl,*.pm,*.sh,*.rb,*.py,*.xml,*.gradle,.vimrc,.bashrc,.bash_profile,.zshrc :call StripTrailingWhitespace()
autocmd BufWritePre Makefile,*.inc,*.mk,*.c,*.cpp,*.h,*.pl,*.pm,*.sh,*.rb,*.py,*.xml,*.gradle,.vimrc,.bashrc,.bash_profile,.zshrc retab
"autocmd VimEnter * FC .
autocmd BufWinEnter * normal zR

" ctrlp config
let g:ctrlp_user_command = 'find %s -regextype egrep -type f -regex ".*\.(cpp|h|hpp)"'
let g:ctrlp_by_filename = 1
let g:ctrlp_reuse_window = 'startify'

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

autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ | endif
                \ |   NERDTree
                \ |   wincmd w

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
