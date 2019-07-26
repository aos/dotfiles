" ========= Auto-install ================== {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" ========= Plugins ======================= {{{
call plug#begin('~/.local/share/nvim/plugged')

"Plug 'Valloric/YouCompleteMe'           " Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'                         " Asynchronous linter
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                 " Fast fuzzy finder (:fzf)
Plug 'tpope/vim-fugitive'               " Awesome git wrapper (:Git)
Plug 'tpope/vim-surround'               " Parentheses surrounded (ys, cs, ds)
Plug 'jiangmiao/auto-pairs'             " Autoclose brackets, parens, quotes
Plug 'junegunn/vim-easy-align'          " Easy align stuff! (Use `ga`)
Plug 'justinmk/vim-dirvish'             " File explorer
Plug 'kristijanhusak/vim-dirvish-git'   " Plug git into dirvish
Plug 'lilydjwg/colorizer'               " Colorize hex #FFF
Plug 'aos/tslime.vim'                   " Send commands from vim to tmux
" Markdown previewer
Plug 'kannokanno/previm', { 'for': 'markdown' }

" Go swiss army knife
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" On-demand lazy-loaded syntax highlighting for ALL the languages
Plug 'sheerun/vim-polyglot'
" Rainbow parentheses for scheme/lisp
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['scheme', 'lisp'] }
" Grab vim-sexp for selecting forms
Plug 'guns/vim-sexp'
" And let's make it easier to use
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Language servers (for deoplete)
Plug 'zchee/deoplete-jedi'              " Python
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Colorschemes
Plug 'lifepillar/vim-gruvbox8'
"Plug 'bluz71/vim-moonfly-colors'
"Plug 'joshdick/onedark.vim'
"Plug 'mhartington/oceanic-next'
"Plug 'keith/parsec.vim'
"Plug 'jnurmine/Zenburn'
"Plug 'caksoylar/vim-mysticaltutor'
"Plug 'Nequo/vim-allomancer'
"Plug 'crusoexia/vim-monokai'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'mhartington/oceanic-next'
"Plug 'junegunn/seoul256.vim'
"Plug 'jnurmine/Zenburn'
"Plug 'chriskempson/base16-vim'
"Plug 'romainl/Apprentice'
"Plug 'tyrannicaltoucan/vim-deep-space'
call plug#end()
" }}}

" ========= General Config ================ {{{
let mapleader = ","                     " Map leader to comma
let maplocalleader = "\\"               " Maps local leader to backslash
set number 	                        " line numbers
set wrap                                " Wrap lines
set history=1000	                " Store lots of :cmdline history
set showcmd		                " Show incomplete commands
set showmode		                " Show current mode down the bottom
set visualbell		                " No sounds
set clipboard=unnamed,unnamedplus	" Use system clipboard with yank
set relativenumber                      " See NumberToggle function below
set title		                " Give more detailed title for time-tracking apps
set hidden                              " Allows making buffers hidden
set backspace=indent,eol,start          " Proper backspace behavior
set timeoutlen=400
set autoread                            " Auto-read file when changed from outside
set textwidth=79                        " Set the max text with, use 'gq'
set spelllang=en
set spellfile=$HOME/GDrive/vim/spell/en.utf-8.add  " Sets spellfile
set inccommand=nosplit                  " Shows realtime changes of Ex command

" Sets cursor types based on mode (bar and line)
if exists("$TMUX")
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
  " This allows italics and bold within tmux and vim
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
endif
" }}}

" ========= Status line =================== {{{
set laststatus=2                        " Always show statusbar

set statusline=
set statusline+=%#ModeMsg#              " Buffer number color
set statusline+=\ %-1.2n\               " Space offset for buffer number
set statusline+=%#Folded#%{GitInfo()}\  " Set git info with color
set statusline+=%#ColorColumn#          " CursorColumn color
set statusline+=%f                      " Relative path to file
set statusline+=\%r%w                   " Read-only flag (and preview)
set statusline+=\ %m                    " Modified flag
set statusline+=%=                      " Right align
set statusline+=\ %y                    " Filetype
set statusline+=\ %l:%c\ %L             " Line number : column number (total lines)
set statusline+=\ %p%%                  " Percent
set statusline+=\  
" }}}

" ========= Color scheme and filetype ===== {{{
filetype plugin indent on
syntax enable
set termguicolors
set background=dark
"let g:oceanic_next_terminal_bold=1
"let g:oceanic_next_terminal_italic=1
"let g:onedark_terminal_italics=1
colorscheme gruvbox8
"let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_transp_bg = 1
"let g:seoul256_background = 234
"let g:deepspace_italics=1
"let g:palenight_terminal_italics=1
"let g:monokai_term_italic = 1
let g:jsx_ext_required = 0               " JSX syntax highlight in .js files
"let ruby_operators = 1                  " Highlights ruby operators
" }}}

" ========= GUI color/syntax ============== {{{
set cursorline
set cursorcolumn
"highlight column 80
set colorcolumn=80
highlight ColorColumn guibg=#3A3A3A
highlight CursorLine guibg=#2F2F2F
highlight CursorColumn guibg=#2F2F2F
highlight LineNr guibg=NONE

" == Tab bar coloring
highlight TabLineFill guibg=#3A3A3A guifg=#3A3A3A
highlight TabLine guibg=#B7B7B7 guifg=#3A3A3A
highlight TabLineSel guifg=#D6B600
" == Remove tildes at end of buffer
"highlight! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" == Highlight extra whitespace as green
highlight ExtraWhitespace guibg=lightgreen
" }}}

" ========= Menu and other options ======== {{{
set splitbelow    " Always open vsplit below
set splitright    " ... and to right
set undofile 	  " Persistent undo
set lazyredraw    " Speed up buffer loading
set modeline      " Enable modeline -> Allows custom config for each file
set nojoinspaces  " Prevents inserting two spaces after punctuation on join
set wildchar=<Tab>
set wildmenu      " Opens wildmenu for tab completion of commands
set wildmode=longest:list,full
set listchars=tab:▸\ ,eol:¬
" }}}

" ========= Folding options =============== {{{
set foldmethod=indent                     " Fold based on indent
set foldnestmax=3                         " Deepest fold is 3 levels
set foldlevelstart=99                     " All folds open by default
highlight Folded guibg=#000 guifg=#a3a34c
" }}}

" ========= Plugin options ================ {{{
" === ale
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8'],
  \ 'ruby': ['rubocop'],
  \ 'jsx': ['eslint', 'stylelint']
\}
let g:ale_sign_error = '▶▶'
let g:ale_sign_warning = '┄┄'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_javascript_eslint_suppress_missing_config = 1

" === vim-go
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" === vim-polyglot
" Disable polyglot for go because we use vim-go
let g:polyglot_disabled = ['go']

" Map moving between lint errors to C-k and C-j
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

hi! link ALEErrorSign WarningMsg
hi! ALEError ctermbg=none
hi! ALEWarning ctermbg=none

" === Previm -- preview file using :PrevimOpen
let g:previm_open_cmd = 'open -a FirefoxDeveloperEdition'

" === Tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
" Send paragraph (vip) to Tmux
nmap <localleader>n <Plug>NormalModeSendToTmux
" Send selection to Tmux
vmap <localleader>s <Plug>SendSelectionToTmux
" Reset the session, window, and pane info
nmap <localleader>R <Plug>SetTmuxVars
" Send something to Tmux
nmap <localleader>t :Tmux 

" === Easy Align
" Interactive EA in visual mode (vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EA for motion/text object (gaip)
nmap ga <Plug>(EasyAlign)

" === Dirvish Git
hi DirvishGitStaged guifg=#689D6A guibg=#262626
hi DirvishGitModified guifg=#D65D0E guibg=#262626
hi DirvishGitUntracked guifg=#9D0006 guibg=#262626
" }}}

" ========= Python provider install ======= {{{
if has('mac')
  let g:python3_host_prog = '/usr/local/bin/python3'
  let g:python_host_prog = '/usr/bin/python'
endif
" }}}

" ========= Deoplete global options ======= {{{
" Use tab and S-tab to cycle between autocomplete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Autoclose preview window
autocmd! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_insertion = 1
" completions for go (using vim-go)
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
" }}}

" ========= Turn off swap files =========== {{{
set noswapfile
set nobackup
set nowritebackup
" }}}

" ========= Indentation =================== {{{
" Number of spaces that a <Tab> counts for while editing
set softtabstop=2
" Indentation amount for < and > commands
let &shiftwidth = &softtabstop
set shiftround      " Round indent to multiple of 'shiftwidth'
set expandtab       " Insert spaces when <Tab> is pressed
"set tabstop=2       " Render tabs using this many spaces
" }}}

" ========= Scrolling ===================== {{{
set scrolloff=8		" Scroll when we're 8 lines away from margins
set sidescrolloff=7
set sidescroll=1

set mouse=a
" }}}

" ========= Searching ===================== {{{
set hlsearch        " Highlight search
set ignorecase
set smartcase
set infercase
"set gdefault        " Use 'g' flag by default with :s/foo/bar
set magic           " Use 'magic' patterns (extended reg exp)
set incsearch       " Incremental search, hit '<CR>' to stop

if has('mac')
  set wildignorecase " Ignores case when completing file names and dirs
endif

" Redefines # and * for visual mode to search visually selected
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '|'), '|n', '||n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
" }}}

" ========= Functions ===================== {{{

" Toggle between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Open daily log and append a time stamp
function! AppendToLog()
  let time=strftime('%x %X (%Z)')
  sp ~/.daily_log
  call append('$', ['', time, ''])
  execute "normal! Go* "
  startinsert!
endfunc

" JSON pretty print
function! JSONify()
  if executable('jq')
    %!jq '.'
  else
    %!python -mjson.tool
  endif
  set syntax=json
endfunction

" Inline variable
function! InlineVariable()
  " Copy the variable under the cursor into the 'a' register
  :let l:tmp_a = @a
  :normal "ayiw
  " Delete variable and equals sign
  :normal 2daW
  " Delete the expression into the 'b' register
  :let l:tmp_b = @b
  :normal "bd$
  " Delete remnants of the line
  :normal dd
  " Go to the end of the previous line so we can start our search for the 
  " usage of the variable to replace. Doing '0' instead of 'k$' doesn't work
  normal k$
  " Find the next occurence of the variable
  exec '/\<' . @a . '\>'
  " Replace that occurence with the text we yanked
  exec ':.s/\<' . @a . '\>/' . escape(@b, "/")
  :let @a = l:tmp_a
  :let @b = l:tmp_b
endfunction
nnoremap <leader>ri :call InlineVariable()<CR>

" Redirect the output of a Vim or external command into a scratch buffer
function! Redir(cmd)
  for win in range(1, winnr('$'))
    if getwinvar(win, 'scratch')
      execute win . 'windo close'
    endif
  endfor
  if a:cmd =~ '^!'
    execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
  else
    redir => output
    execute a:cmd
    redir END
  endif
  vnew
  let w:scratch = 1
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(output, "\n"))
endfunction
" Usage:
"   :Redir hi           show the full output of command ':hi' in scratch win
"   :Redir !ls -al      show the full output of command ':!ls -al' in scratch
command! -nargs=1 -complete=command Redir silent call Redir(<f-args>)

function! SwitchParams(a, b, c, hello)
  let l:tmp_a = @a
  " Delete the parameter into the @a register
  normal "adiw
  " Delete the space and insert comma after next parameter, then word
  exec "normal! dwea, \<C-r>a\<Esc>B"
  let @a = l:tmp_a
endfunction
nnoremap <leader>p :call SwitchParams()<CR>

function! GitInfo()
  let git = FugitiveHead()
  if git != ''
    return '(' . FugitiveHead() . ')'
  else
    return ''
endfunction

" Create a scratch buffer, can give it a filetype using an option such as:
" ft=javascript
function! ScratchEdit(cmd, options)
  exe a:cmd tempname()
  setl buftype=nofile bufhidden=wipe nobuflisted
  if !empty(a:options) | exe 'setl' a:options | endif
endfunction

command! -bar -nargs=* Sedit call ScratchEdit('edit', <q-args>)
command! -bar -nargs=* Ssplit call ScratchEdit('split', <q-args>)
command! -bar -nargs=* Svsplit call ScratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Stabedit call ScratchEdit('tabe', <q-args>)
" }}}

" ========= Key mappings ================== {{{

" Map 'Y' to be like 'C' and 'D' -- for consistency
nnoremap Y y$

" When pasting in visual mode don't replace my register with selection
xnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<CR>

" Clear search highlight with escape key
nnoremap <silent> <Esc> :noh<CR><Esc>

" Maps insert-mode 'jk' to escape key
inoremap jk <Esc>

" Open file explorer in new vertical split pane
nnoremap _ <C-w>v:Dirvish<CR>

" Highlight last INSERTED text
nnoremap gV `[v`]

" Let's remap Q to be @@ so that replaying macros is that much easier
nnoremap Q @@

" Map neovim terminal exit to jk
tnoremap jk <C-\><C-n>

" Remaps original <Tab> function (forward jumplist) to <C-p>
" We do this because we end up using <Tab> for FZF
noremap <C-p> <Tab>

" Remap BS in normal mode to flip back to the last buffer
nnoremap <BS> <C-^>

"=== Command-line {{{
" start of line
cnoremap <C-A> <Home>
" back one character
cnoremap <C-B> <Left>
" delete character under cursor
cnoremap <C-D> <Del>
" end of line
cnoremap <C-E> <End>
" forward one character
cnoremap <C-F> <Right>
" recall newer command-line
cnoremap <C-N> <Down>
" recall previous (older) command-line
cnoremap <C-P> <Up>
" }}}

" === Custom text objects {{{
" inner-line
xnoremap <silent> il :<C-u>normal! g_v^<CR>
onoremap <silent> il :<C-u>normal! g_v^<CR>
" }}}

" === Operator pending ======== {{{

" Inside last/next parenthesis and go to insert mode
onoremap in( :<c-u>normal! f(vi(<CR>
onoremap il( :<c-u>normal! F(vi(<CR>
" }}}

" === Swap ; and : functionality {{{

" Use ':' to go to next item in list
"noremap : ;
" Use ';' for commands
"noremap ; :
" }}}

" === Fold mappings =========== {{{

" Map folding to <Space>
noremap <Space> za
noremap <expr> <Leader><Space> &foldlevel ? 'zM' : 'zR'
" }}}

" === Movement mappings ======= {{{

" Remap 'j' and 'k' to account for text wrapping
noremap j gj
noremap k gk

" Map moving to beginning and end of line
noremap H ^
nnoremap L $
onoremap L $
vnoremap L g_

" Map moving page up and down
"noremap <C-j> <C-d>
"noremap <C-k> <C-u>
" }}}

" === Leader mappings ========= {{{

" Open command look up file
nnoremap <Leader>m :sp ~/.cmd_lookup<CR>

" Quick-edit daily log
nnoremap <Leader>l :call AppendToLog()<CR>

" Quick-edit .vimrc (horizontal split)
nnoremap <Leader>ev :sp ~/.vimrc<CR>

" Quick-source .vimrc
nnoremap <Leader>sv :source ~/.vimrc<CR>

" Save a session (can be re-opened with nvim -S)
nnoremap <Leader>n :mksession<CR>

" Toggle between normal and relative numbering
nnoremap <silent> <Leader>r :call NumberToggle()<CR>

" Map search and replace to 's', global and ask for confirmation
nnoremap <Leader>s :%s///gc<Left><Left><Left><Left>

" Map highlighting trailing whitespace (wn -> On, wf -> Off, wd -> Delete)
nnoremap <Leader>wn :match ExtraWhitespace /\s\+$/<CR>
nnoremap <Leader>wf :match<CR>
nnoremap <Leader>wd :%s/\s\+$//e<CR>

" Copy current file name (relative/absolute) to system clipboard
" relative path (src/foo.txt)
nnoremap <Leader>cfr :let @*=expand("%")<CR>

" absolute path (/usr/blah/src/foo.txt)
nnoremap <Leader>cfa :let @*=expand("%:p")<CR>

" filename only (foo.txt)
nnoremap <Leader>cff :let @*=expand("%:t")<CR>

" directory name (/usr/blah/src)
nnoremap <Leader>cfd :let @*=expand("%:p:h")<CR>
" }}}

" === FZF and Ag ============== {{{
" Use project root (through git)
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! PF execute 'Files' s:find_git_root()

" Augment Ag with preview window
" Options: delimiter to remove searching file names as well
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \ <q-args>,
  \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \ <bang>0)

" Augment :Files with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \                    fzf#vim#with_preview('right:50%:hidden', '?'),
  \                    <bang>0)

" Map fzf most-recently-used file search
noremap <Leader>h :History<CR>
noremap <Leader>f :Files<CR>
" Map silver_searcher
noremap <Leader>g :Ag
" Map buffer list and open (fzf)
noremap <Tab> :Buffers<CR>
" }}}
" }}}

" ========= Commands ====================== {{{

" Calls JSONify to pretty print JSON
command! J :call JSONify()

" Make current buffer executable
command! Chmodx :!chmod a+x %

" Toggle spellchecker
command! Spell :setlocal spell! spell?
" }}}

" ========= Autocmds ====================== {{{

augroup js_comment
  autocmd!
  autocmd FileType javascript noremap <Leader>/ I// <Esc><Left><Left>
augroup END

augroup py_ruby_comment
  autocmd!
  autocmd FileType python noremap <Leader>/ I# <Esc><Left><Left>
augroup END

augroup remove_extra_comments_js_c
  autocmd!
  autocmd FileType c,cpp,javascript,javascript.jsx setlocal comments-=:// comments+=f://
augroup END

"augroup remove_extra_comments_ruby_py
"  autocmd!
"  autocmd FileType python,ruby setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"augroup END

" Add rainbow parenthesis and remove autopairs matching for ' and `
augroup rainbow_autopairs_lisp_scheme_clojure
  autocmd!
  autocmd FileType lisp,clojure,scheme
    \ RainbowParentheses |
    \ let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"'}
augroup END

augroup save_views_and_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" Dirvish config
augroup dirvish_config
  autocmd!
  " Map `t` to open in new tab.
  autocmd FileType dirvish
    \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
    \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
  " Map `gh` to hide dot-prefixed files.  Press `R` to 'toggle' (reload).
  autocmd FileType dirvish nnoremap <silent><buffer>
    \  gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<CR>
augroup END
" }}}

" vim: foldmarker={{{,}}}:foldmethod=marker:
