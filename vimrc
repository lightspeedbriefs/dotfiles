if has('nvim')
    let s:plugged_dir = stdpath('data') . '/plugged'
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    let s:plugged_dir = '~/.vim/plugged'
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" {{{ Plugins
call plug#begin(s:plugged_dir)

" Syntax checkers
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
Plug 'w0rp/ale'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Browse tags for the current file to get an overview of its structure in a sidebar
" Also consider vista.vim when this issue has been fixed:
" https://github.com/liuchengxu/vista.vim/issues/123
Plug 'majutsushi/tagbar'

" Nice start screen when vim is opened with no args
Plug 'mhinz/vim-startify'

" Graph your undo tree
Plug 'simnalamburt/vim-mundo'
Plug 'mbbill/undotree'

" Fuzzy file, buffer, mru, tag, etc. finder
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'nixprime/cpsm', { 'do': './install.sh' }

if executable('python')
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    if executable('poetry')
        Plug 'petobens/poet-v'
    endif
endif

" Still in beta, has rough edges
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Unfortunately, skim lacks a maintainer for Fedora
" so upstream is no longer shipping it:
" https://bugzilla.redhat.com/show_bug.cgi?id=1823686
" Additionally, the upstream fzf package seems to be
" missing functionality in the vim plugin (e.g. it does
" not provide the :Commits command)
Plug 'junegunn/fzf.vim'

" Align statements such as assignments
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
" See also: https://github.com/lambdalisue/fern.vim
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

" Show git blame snippets to the right of the text on each line
Plug 'APZelos/blamer.nvim'

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

" % operator on steroids
Plug 'andymass/vim-matchup'

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

" Open a link by pressing 'gx' on it, or search a word or phrase by pressing 'gx' on it
Plug 'tyru/open-browser.vim'

" Look up documentation for by pressing gK
Plug 'keith/investigate.vim'

" Open file:line:col
Plug 'kopischke/vim-fetch'

" toml syntax
Plug 'cespare/vim-toml'

" Meson syntax
if executable('meson')
    Plug 'mesonbuild/meson', { 'rtp': 'data/syntax-highlighting/vim' }
endif

" Dart syntax
if executable('dart')
    Plug 'dart-lang/dart-vim-plugin'
endif

" Zig syntax
if executable('zig')
    Plug 'ziglang/zig.vim'
endif

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

if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'

    " Kind of like :BLines or :CtrlPLine or :LeaderfLine
    Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

    if executable('gdb') || executable('lldb')
        Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
    endif
else
    Plug 'markonm/traces.vim'
endif

if executable('c++')
    " Run google test framework unit tests within vim
    Plug 'alepez/vim-gtest'

    if executable('cmake') && executable('python')
        Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' } " . (executable('rustc') ? ' --racer-completer' : '') }
        " This needs to go *after* ultisnips in vimrc
        " Plug 'tenfyzhong/CompleteParameter.vim'

        " Fork of YCM with better completion for function parameters
        " See: http://nosubstance.me/articles/2015-01-29-better-completion-for-cpp/
        "Plug 'oblitum/YouCompleteMe', { 'do': './install.py --clang-completer' . (executable('rustc') ? ' --racer-completer' : '') }
        Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    endif
endif

" }}}

" {{{ Themes

" Note for Fedora: fontawesome fonts are way out of date.
" https://bugzilla.redhat.com/show_bug.cgi?id=1543407
" https://bugzilla.redhat.com/show_bug.cgi?id=1808064
" There is a copr that can be used in the meantime:
" https://copr.fedorainfracloud.org/coprs/vishalvvr/fontawesome-fonts/
Plug 'ryanoasis/vim-devicons'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

" }}}

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
set wildignore=*.o,*.d,*.so,*.a,*.bin,*.pyc " ignore generated files
set wildignore+=*.pdf,*.wav,*.mp3,*.flac,*.ogg,*.mp4,*.avi,*.mkv,*.webm,*.iso " ignore binary files
set wildignore+=*.dmg,*.exe,*.dll,*.pcacp,*.7z,*.deb,*.rpm,*.mobi,*.epub,*.otf,*.ttf " ignore binary files
set wildignore+=*.zip,*.gz,*.xz,*.tar,*.rar,*.zst,*.bz2,*.tgz " ignore compressed/archive files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*, " ignore SCM files
set wildignore+=*.png,*.jpg,*.jpeg,*.gif " ignore image files
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

if has('nvim')
    " Workaround these issues:
    " https://github.com/neovim/neovim/issues/4696
    " https://github.com/neovim/neovim/issues/7018
    augroup termcolor
      autocmd!
      autocmd TermOpen term://*zsh colorscheme nord
      autocmd BufHidden term://*zsh colorscheme onedark | doautoall ColorScheme onedark
    augroup END
endif

silent! colorscheme onedark
"hi clear CursorLine " need CursorLine highlighted for ctrlp
highlight SpellBad ctermbg=none cterm=underline
highlight SpellCap ctermbg=none cterm=underline
highlight SpellLocal ctermbg=none cterm=underline
highlight SpellRare ctermbg=none cterm=underline
" }}}

" {{{ Mappings
map <Space> <Leader>
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

nnoremap <silent> <leader>bt :BlamerToggle<cr>

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

autocmd BufWritePre * :call StripTrailingWhitespace()
autocmd BufWritePre * retab

autocmd BufWinEnter * normal zR

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup custom_filetype
    au!

    au FileType yaml,yml setlocal sw=2 sts=2

    au FileType gitcommit setlocal spell cc=80
    au FileType README setlocal spell cc=80
    au FileType text,txt setlocal spell cc=80
    au FileType markdown setlocal spell cc=80
    au FileType vimwiki setlocal spell cc=80
    au FileType rst setlocal spell cc=80
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
if executable('c++')
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
endif
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
let g:airline_powerline_fonts = 1
let g:airline_theme= 'onedark'

" neomake config
let g:neomake_cpp_clang_args = ["-std=c++17", "-Wall", "-Wextra"]

" vim-matchup config
let g:matchup_matchparen_offscreen = {'method': 'popup'}

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

" leaderf config
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_StlColorscheme = 'one'
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_ExternalCommand = 'fd -t f . "%s"'
" Unfortunately, this doesn't work the way I would have hoped (A with fallback
" to a).  Instead, it is either A or a and a is always chosen https://git.io/JfaV9
let g:Lf_WorkingDirectoryMode = 'Aa'
let g:Lf_AutoResize = 1
" Using "git ls-files --others" results in hidden files/dirs being included
let g:Lf_UseVersionControlTool = 0
" This only works for BufTag
" let g:Lf_PreviewCode = 1
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_ReverseOrder = 1
let g:Lf_PreviewHorizontalPosition = 'center'

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

" aerojump config
nmap <Leader>as <Plug>(AerojumpSpace)
nmap <Leader>ab <Plug>(AerojumpBolt)
nmap <Leader>aa <Plug>(AerojumpFromCursorBolt)
nmap <Leader>ad <Plug>(AerojumpDefault) " Boring mode

" blamer config
" let g:blamer_enabled = 1

" poetv config
let g:poetv_executables = ['poetry']
let g:poetv_auto_activate = 1

if has('nvim')
    lua require'colorizer'.setup()
endif

let g:vim_search_pulse_disable_auto_mappings = 1

" Make interestingwords, searchindex, and pulse all work together
autocmd VimEnter * map n <Plug>InterestingWordsForeward<Plug>Pulse
autocmd VimEnter * map N <Plug>InterestingWordsBackward<Plug>Pulse
autocmd VimEnter * map * <Plug>ImprovedStar_*<Plug>Pulse
autocmd VimEnter * map # <Plug>ImprovedStar_#<Plug>Pulse
autocmd VimEnter * map g* <Plug>ImprovedStar_g*<Plug>Pulse
autocmd VimEnter * map g# <Plug>ImprovedStar_g#<Plug>Pulse

iab todo TODO
iab fixme FIXME
iab xxx XXX

" }}}
