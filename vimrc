if has('nvim')
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" {{{ Plugins
call plug#begin(fnamemodify($MYVIMRC, ':p:h') . '/plugged')

" Syntax checkers
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
Plug 'w0rp/ale'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Browse tags for the current file to get an overview of its structure in a sidebar
Plug 'majutsushi/tagbar'

" Nice start screen when vim is opened with no args
Plug 'mhinz/vim-startify'

" Graph your undo tree
Plug 'simnalamburt/vim-mundo'
Plug 'mbbill/undotree'

" Fuzzy file, buffer, mru, tag, etc. finder
Plug 'ctrlpvim/ctrlp.vim'
" Last updated Sep '15
Plug 'sgur/ctrlp-extensions.vim'

Plug 'nixprime/cpsm', { 'do': './install.sh' }

" Other fuzzy finders worth examining: command-t, LeaderF, vim-picker

"if executable('ruby') && executable('make') && executable('cc')
"    Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make -j$(proc)' }
"endif

"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

"Plug 'srstevenson/vim-picker'

" Align statements such as assignments
" Last updated Mar '16
Plug 'junegunn/vim-easy-align'

if executable('ctags')
    " Regenerate tags files while you work
    Plug 'ludovicchabant/vim-gutentags'
endif

" Place, toggle, and display marks
Plug 'kshenoy/vim-signature'

" Correct common misspellings and typos
Plug 'chip/vim-fat-finger'

" File navigation tree window
Plug 'scrooloose/nerdtree'

" Show git status symbols in the nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Show differences
" Note: signify recommends using gitgutter if you are only using git and no
" other VCS, as it has more git-specific functionality
" Plug 'mhinz/vim-signify'

" Show a git diff in the gutter (sign column) and stage/revert hunks.
" Note: gitgutter recommends using signify if you use VCS tools other than git
Plug 'airblade/vim-gitgutter'

" Floating windows with Git blame
Plug 'rhysd/git-messenger.vim'

" Git commit browser
Plug 'junegunn/gv.vim'

" Superior alternatives to ack.vim
" These plugins offer extremely similar functionality,
" although ctrlsf seems more featureful
Plug 'dyng/ctrlsf.vim'
Plug 'mhinz/vim-grepper'

" Incremental search highlighting of all hits
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Commenting plugins
Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'

" Show the contents of the registers on the sidebar when you hit " or @ in normal
" mode or <CTRL-R> in insert mode
Plug 'junegunn/vim-peekaboo'

" Highlight different words at the same time, and navigate through the highlighted
" words just like you would navigate through the results of a search.  This is
" very similar in functionality to vim-mark
Plug 'lfv89/vim-interestingwords'

" Display how many search results there were and which number the cursor is
" currently on.
Plug 'google/vim-searchindex'

" Pulse to indicate where the next search word is
Plug 'inside/vim-search-pulse'

" Position the cursor to any place inside pairs objects such as () and just type vv
" to select the text within the pairs
Plug 'gorkunov/smartpairs.vim'

" Multiple selection
Plug 'terryma/vim-multiple-cursors'

" Create an awesome status line
Plug 'vim-airline/vim-airline'

" Generate a shell prompt from airline config
Plug 'edkolev/promptline.vim'

" Open a link by pressing 'gx' on it, or search a word or phrase by pressing 'gx' on it
Plug 'tyru/open-browser.vim'

" Look up documentation for by pressing gK
Plug 'keith/investigate.vim'

" Open file:line:col
Plug 'kopischke/vim-fetch'

" Nix syntax
Plug 'LnL7/vim-nix'

" Meson syntax
Plug 'mesonbuild/meson', { 'rtp': 'data/syntax-highlighting/vim' }

" Run google test framework unit tests within vim
Plug 'alepez/vim-gtest'

" Generate ultra-fast shortcuts to move anywhere
Plug 'easymotion/vim-easymotion'

" Highlight targets for character motions ('f', 'F', 't', 'T', ';', ',')
Plug 'unblevable/quick-scope'

" Generate shortcuts using 's'
Plug 'justinmk/vim-sneak'

" When you tell vim to open a file that doesn't exist, but a similarly named
" file exists, ask if that's what you meant to open
Plug 'EinfachToll/DidYouMean'

" Switch between source and header (alternatives to this include a.vim and altr)
Plug 'derekwyatt/vim-fswitch'

" General-purpose command-line fuzzy finder
Plug 'lotabout/skim.vim'

" Workaround for NERDTree making bd close vim http://stackoverflow.com/a/16505009
Plug 'mhinz/vim-sayonara'

" Display function signatures from completions in the command line
Plug 'Shougo/echodoc.vim'

" Highlight yanked text briefly
Plug 'machakann/vim-highlightedyank'

" Snippets
Plug 'SirVer/ultisnips'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

" Code completion for C++
" There's several options: Deoplete (with deoplete-clang) for neovim,
" neoplete (for vim), clang_complete, YouCompleteMe,
" nvim-completion-manager, and completor.vim

" C++ semantic highlighting

" This plugin looks cool but requires a patched YouCompleteMe
" The benefit is that the compiler is invoked only once for both
" completion and semantic highlighting
" Plug 'davits/DyeVim'

if has('nvim')
    "Plug 'roxma/nvim-completion-manager'
    " Fork of clang_complete focused on integration with nvim-completion-manager
    "Plug 'roxma/clang_complete'

    " This plugin has support for neovim out of the box, but it claims
    " to be in an "alpha" state, and it is indeed somewhat buggy
    " Plug 'arakashic/chromatica.nvim'

    if executable('gdb') || executable('lldb')
        Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
    endif
else
    "Plug 'maralla/completor.vim'

    " This plugin currently only supports vim and not neovim
    " Disabled due to taking up a massive amount of disk space
    "Plug 'jeaye/color_coded', { 'do': 'cmake . && make -j$(nproc) && make install' }
endif

if executable('cmake') && executable('python') && executable('c++')
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' } " . (executable('rustc') ? ' --racer-completer' : '') }
    " This needs to go *after* ultisnips in vimrc
    " Plug 'tenfyzhong/CompleteParameter.vim'

    " Fork of YCM with better completion for function parameters
    " See: http://nosubstance.me/articles/2015-01-29-better-completion-for-cpp/
    "Plug 'oblitum/YouCompleteMe', { 'do': './install.py --clang-completer' . (executable('rustc') ? ' --racer-completer' : '') }
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
endif

" }}}

" {{{ Themes
Plug 'AlessandroYorba/Alduin'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'baskerville/bubblegum'
Plug 'romainl/Apprentice'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug '0ax1/lxvc'

Plug 'ryanoasis/vim-devicons'

Plug 'joshdick/onedark.vim'
Plug 'koron/nyancat-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'zanglg/nova.vim'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'

call plug#end()
" }}}

" {{{ Settings
filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set display=lastline
set incsearch
set laststatus=2
" Neovim sets mouse="a"
set mouse=""
set nocompatible
set tags=./tags;,tags
set ttyfast
set viminfo+=! " Save and restore global variables
set encoding=utf-8

" Not set by Neovim:
set background=dark
set cino+=N-s
set cino+=g0
set cino+=l1
set clipboard=unnamedplus
set expandtab
set foldcolumn=1
set foldmethod=syntax
set formatoptions+=n
set hidden
set hlsearch
set laststatus=2
set lazyredraw
set linebreak
set matchpairs+=<:>
set nowrap
set number
set path+=/usr/local/include
set shiftwidth=4
set showmatch
set smartindent
"set spell
set softtabstop=4
set t_ZH=[3m
set t_ZR=[23m
set tabstop=4
set title
set titlestring=[%{hostname()}]\ vim(%{expand(\"%\")})\ %h%r%m
set icon
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number of lines to save for undo on a buffer reload
set virtualedit=all
set wildignore=*.o,*.d,*.so,*.a,*.bin,*.pyc
set wildmode=list:longest,full
set winwidth=85
set cmdheight=2
set completeopt=menu,menuone
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
if has('nvim')
    set inccommand=split
else
    set undodir=~/.vim/undodir
    set directory=~/.vim/swap
    set backupdir=~/.vim/backup
endif
if has('termguicolors')
    set termguicolors
endif

let g:nord_italic = 1
let g:nord_underline = 1

" Make the foldcolumn a bit brighter than the line numbers
augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight FoldColumn guifg=#7b88a1
augroup END

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme onedark call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

" Workaround these issues:
" https://github.com/neovim/neovim/issues/4696
" https://github.com/neovim/neovim/issues/7018
augroup termcolor
  autocmd!
  autocmd TermOpen * colorscheme nord
  autocmd BufHidden term://* colorscheme onedark | doautoall ColorScheme onedark
augroup END

silent! colorscheme onedark
"hi clear CursorLine " need CursorLine highlighted for ctrlp
highlight SpellBad ctermbg=none cterm=underline
highlight SpellCap ctermbg=none cterm=underline
highlight SpellLocal ctermbg=none cterm=underline
highlight SpellRare ctermbg=none cterm=underline
" }}}

" {{{ Mappings
noremap <silent> <F1> :bp<CR>
noremap <silent> <F2> :bn<CR>
noremap <silent> <F3> :b#<CR>
noremap <silent> <F4> :FSHere<CR>
noremap <silent> <F5> :ALEToggle<CR>
noremap <silent> <F6> :NERDTreeToggle<CR>
noremap <silent> <F7> :UndotreeToggle<CR>
set pastetoggle=<F8>
noremap <silent> <F9> :CtrlSFToggle<CR>
noremap <silent> <F11> :TagbarToggle<CR>
noremap <silent> <F12> :GundoToggle<CR>

" Workaround for NERDTree making bd close vim http://stackoverflow.com/a/16505009
" An alternative fix is to use bufkill (last commit Aug 16)
nnoremap <silent> <leader>bd :bp<cr>:bd #<cr>

nnoremap <silent> <C-Bslash> :CtrlPBuffer<cr>

inoremap <silent> <C-n> :set invhlsearch<CR>
nnoremap <silent> <C-n> :set invhlsearch<CR>
noremap <silent> <C-s> :set invspell<CR>
noremap <silent> <C-h> :MarkClear<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>
nnoremap <silent> <C-Left> :wincmd h<CR>
nnoremap <silent> <C-Up> :wincmd k<CR>
nnoremap <silent> <C-Down> :wincmd j<CR>

noremap <silent> <C-l> :setl <C-R>=&rnu ? "nornu" : "rnu"<CR><CR>

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

nmap <leader>q <Plug>(QuickScopeToggle)
vmap <leader>q <Plug>(QuickScopeToggle)

" Source code navigation
"au FileType c,cpp  nmap gd <Plug>(clang_complete_goto_declaration)
nnoremap <silent> gd :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> gi :YcmCompleter GoToInclude<CR>
nnoremap <silent> gt :YcmCompleter GetType<CR>
nnoremap <silent> gk :YcmCompleter GetDoc<CR>

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap gp <Plug>(ale_previous_wrap)
nmap gn <Plug>(ale_next_wrap)

nnoremap <silent> <M-t> :Tags<CR>

" Switch to the file and load it into the current window
nnoremap <silent> <Leader>of :FSHere<cr>
" Switch to the file and load it into the window on the right
nnoremap <silent> <Leader>ol :FSRight<cr>
" Switch to the file and load it into a new window split on the right
nnoremap <silent> <Leader>oL :FSSplitRight<cr>
" Switch to the file and load it into the window on the left
nnoremap <silent> <Leader>oh :FSLeft<cr>
" Switch to the file and load it into a new window split on the left
nnoremap <silent> <Leader>oH :FSSplitLeft<cr>
" Switch to the file and load it into the window above
nnoremap <silent> <Leader>ok :FSAbove<cr>
" Switch to the file and load it into a new window split above
nnoremap <silent> <Leader>oK :FSSplitAbove<cr>
" Switch to the file and load it into the window below
nnoremap <silent> <Leader>oj :FSBelow<cr>
" Switch to the file and load it into a new window split below
nnoremap <silent> <Leader>oJ :FSSplitBelow<cr>

" {{{ CompleteParameter
" inoremap <silent><expr> ( complete_parameter#pre_complete("()")

" nmap <m-d> <Plug>(complete_parameter#overload_down)
" imap <m-d> <Plug>(complete_parameter#overload_down)
" smap <m-d> <Plug>(complete_parameter#overload_down)
"
" nmap <m-u> <Plug>(complete_parameter#overload_up)
" imap <m-u> <Plug>(complete_parameter#overload_up)
" smap <m-u> <Plug>(complete_parameter#overload_up)
" }}}

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)

" }}}

" {{{ autocmds
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

autocmd BufWinEnter * normal zR

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Exit Paste mode when leaving Insert mode
autocmd InsertLeave * set nopaste

function! s:CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      let l:filetypes = ['help', 'quickfix', 'nerdtree', 'taglist']
      if index(l:filetypes, getbufvar(winbufnr(i), '&filetype')) >= 0 ||
            \ getwinvar(i, '&previewwindow')
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      call feedkeys(":only\<CR>:q\<CR>", 'n')
    endif
  endif
endfunction
autocmd BufEnter * call s:CheckLeftBuffers()

augroup shebang_chmod
    autocmd!
    autocmd BufNewFile  * let b:brand_new_file = 1
    autocmd BufWritePost * unlet! b:brand_new_file
    autocmd BufWritePre *
                \ if exists('b:brand_new_file') |
                \   if getline(1) =~ '^#!' |
                \     let b:chmod_post = '+x' |
                \   endif |
                \ endif
    autocmd BufWritePost,FileWritePost *
                \ if exists('b:chmod_post') && executable('chmod') |
                \   silent!  execute '!chmod '.b:chmod_post.' "<afile>"' |
                \   unlet b:chmod_post |
                \ endif
augroup END

autocmd BufEnter * nested :call tagbar#autoopen(0)

"autocmd! BufWritePost * Neomake

" {{{ vim-gtest
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
" }}}

autocmd FileType startify setlocal buftype=

augroup Pulse
    autocmd!
    autocmd User PrePulse  unsilent SearchIndex
    "autocmd User PostPulse call Pulse_off()

    " Pulses the first match after hitting the enter key
    autocmd User IncSearchExecute call search_pulse#Pulse()
augroup END

" }}}

" {{{ Plugin config

" Mark config
" Mark may be found at http://www.vim.org/scripts/script.php?script_id=2666
let g:mwIgnoreCase = 0
let g:mwAutoLoadMarks = 1
let g:mwDefaultHighlightingPalette = 'extended'

" multiple-cursors config
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-f>'
let g:multi_cursor_quit_key='<Esc>'

" easytags config
let g:easytags_async = 1
let g:easytags_syntax_keyword = 'always'

" QuickScope config
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" signify config
let g:signify_vcs_list = [ 'git' ]

" syntastic config
let g:syntastic_cpp_checkers = []
let g:syntastic_c_checkers = []
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++17 -Wall -Wextra'

" YouCompleteMe config
let g:ycm_always_populate_location_list = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'

" clang_complete config
let g:clang_library_path = '/usr/lib64/libclang.so'
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='ultisnips'

" completor config
let g:completor_clang_binary = '/usr/bin/clang'

" chromatica config
let g:chromatica#libclang_path = '/usr/lib64'
let g:chromatica#enable_at_startup = 1

" echodoc
let g:echodoc#enable_at_startup = 1

" CompleteParameter
let g:complete_parameter_use_ultisnips_mappings = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_completed_snippet = 1
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" openbrowser config
let g:netrw_nogx = 1 " disable netrw's gx mapping.

let g:is_bash = 1

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"
let g:airline_powerline_fonts = 1
let g:airline_theme= 'nord'
" Commented out for now because if left uncommented, this seems to prevent
" airline from properly showing colors
"let g:airline_section_a = airline#section#create_left(['mode', 'crypt', 'paste', 'spell', 'capslock', 'iminsert', '%{gutentags#statusline("✎")}'])

" neomake config
let g:neomake_cpp_clang_args = ["-std=c++17", "-Wall", "-Wextra"]

" ALE config
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra'
let g:ale_cpp_clangtidy_options = '-std=c++17 -Wall -Wextra'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra -Wsuggest-override -Wsuggest-final-types -Wsuggest-final-methods -Wdisabled-optimization'
let g:ale_cpp_cppcheck_options = '--enable=style --suppress=passedByValue'

" Disable the checks that ALE runs in favor of those from .clang-tidy
let g:ale_cpp_clangtidy_checks = []

" Only enable cppcheck and clang-tidy, as they utilize compile_commands.json
let g:ale_linters = {
\   'cpp': ['clangtidy', 'cppcheck'],
\}

" ctrlp config
let g:ctrlp_user_command = ['.git', 'git ls-files %s', executable('fd') ? 'fd -t f . %s' : (executable('rg') ? 'rg --files %s' : 'find %s -type f')]
let g:ctrlp_by_filename = 1
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" startify config
let g:startify_change_to_dir = 0

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" fzf config
map <silent> <M-t> :Tags<CR>

" command-t config
let g:CommandTTraverseSCM = 'dir'
let g:CommandTGitScanSubmodules = 1
let g:CommandTFileScanner = 'git'

" NERDTree config
let NERDTreeIgnore = ['\.o$', '\.a$', '\.d$', '\.so$', '\.pyc$', '\.bin$', '\~$']
let NERDTreeWinSize = 40
let NERDTreeQuitOnOpen = 1

" ripgrep/silver searcher config
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  let g:ackgrp = 'ag --vimgrep'
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" ctrlsf config
nmap gr <Plug>CtrlSFCwordPath
nmap gb <Plug>CtrlSFCCwordPath
xmap gr <Plug>CtrlSFVwordPath
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_default_root = 'project+wf'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_case_sensitive = 'yes'

" grepper config
nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'ag', 'grep']
let g:grepper.dir = 'repo,cwd'
let g:grepper.next_tool = '<C-f>'

" sneak config
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

let g:vim_search_pulse_disable_auto_mappings = 1

" Make interestingwords, searchindex, and pulse all work together
autocmd VimEnter * map n <Plug>InterestingWordsForeward<Plug>Pulse
autocmd VimEnter * map N <Plug>InterestingWordsBackward<Plug>Pulse
autocmd VimEnter * map * <Plug>ImprovedStar_*<Plug>Pulse
autocmd VimEnter * map # <Plug>ImprovedStar_#<Plug>Pulse
autocmd VimEnter * map g* <Plug>ImprovedStar_g*<Plug>Pulse
autocmd VimEnter * map g# <Plug>ImprovedStar_g#<Plug>Pulse

" }}}
