""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype detections.
filetype plugin indent on


" More words.
set dictionary=/usr/share/dict/words


" Turn on more auto-indentation
set smartindent
set cindent


" Disable modelines.
set modelines=0


" Stop littering .swp files everywhere.
set noswapfile


" Don't redraw while executing macros.
" set lazyredraw


" Make tab completion a lot smarter (mostly works like zsh).
set wildmode=list:longest,list:full
" set wildmenu (on by default)
set wildignore=*.dll,*.exe,*.pyc,*.pyo,*.egg
set wildignore+=*.jpg,*.gif,*.png,*.o,*.obj,*.bak,*.rbc
set wildignore+=Icon*,\.DS_Store,*.out,*.scssc,*.sassc
set wildignore+=.git/*,.hg/*,.svn/*,*/swp/*,*/undo/*,Gemfile.lock


" Highlight the line the cursor is on.
set cursorline

" Mark the 81st column to make it obvious where 80 characters is.
set colorcolumn=81


" Softtabs, 2 spaces.
set tabstop=2
set shiftwidth=2
set shiftround
set noexpandtab " Find a good way to toggle this maybe there's a plugin?


" Don't wrap text by default.
set nowrap
" Mark wrapped lines.
set showbreak=\ »\ 


" Show extra lines for context.
set scrolloff=5
set sidescroll=1
set sidescrolloff=1


" Show line numbers.
set number
" Don't take up more space than necessary.
set numberwidth=1


" Open new split panes to right and bottom, which feels more natural.
set splitbelow
set splitright


" Searches should be case insensitive unless there's a capital letter.
set ignorecase
set smartcase

" Start searching instantly.
set incsearch
set showmatch

" Highlight all matches for the last used search pattern.
set hlsearch


" Please don't beep.
set visualbell


" Don't show the startup message.
set shortmess=Iac


" Set fold method to indent.
set foldmethod=indent

" Don't fold by default.
set nofoldenable
set foldtext=NeatFoldText()


" Stores undo info in a file so that it persists after vim closes.
set undofile


" Show listchars.
set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:·
set list

" Use a taller character for vertical splits (for no gap)
set fillchars+=vert:│


"
set conceallevel=0
set concealcursor=nc

"
set noshowmode

"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"
set backupcopy=yes

"
set updatetime=250


" Show signs in number column.
set signcolumn=number


" Use spacebar as leader.
let mapleader = " "
let g:mapleader = " "
let g:maplocalleader = " "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I'm honestly not sure what either of these are...

" From http://dhruvasagar.com/2013/03/28/vim-better-foldtext.
function! NeatFoldText()
  let regex = '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*'
  let line = ' ' . substitute(getline(v:foldstart), regex, '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let fill = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(fill, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(fill, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(fill, winwidth(0)-foldtextlength) . foldtextend
endfunction

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Rename current file (from Gary Bernhardt).
" Do I use this?
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" And this was commented out:
" Use <tab> for indent if on a blank/whitespace line,
" or completion if there is text entered.
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Concealerator.
command! ConcealToggle let &conceallevel=&conceallevel==0?2:0

" Search for todos with Ack. TODO: fix this
command! Todos Ack TODO


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easier split navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Scroll up/down scroll faster.
noremap <c-e> 5<c-e>
noremap <c-y> 5<c-y>

" Keep the selection when indenting.
vnoremap < <gv
vnoremap > >gv

" Navigate wrapped lines.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


" Inspect highlight under cursor (for debugging).
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
\ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>


" Remove trailing whitespace (except when escaped).
nnoremap <leader>rw :%s/[^\\]\zs\s\+\ze$//e<cr>:noh<cr>


" Repeat the last :! command.
nnoremap <c-c> :!!<cr>


" Clear highlighted search.
nnoremap <cr> :nohlsearch<cr>


" New tab.
map <leader>tn :tabnew<cr>

" Tab navigation.
nnoremap <silent> <c-n> :tabnext<cr>
nnoremap <silent> <c-p> :tabprev<cr>


" Switch to last buffer.
nnoremap <leader><leader> <c-^>


" Copy and paste from system clipboard.
noremap <leader>p "+p
noremap <leader>y "+y
noremap <leader>P "+P
noremap <leader>Y "+Y


" Write as root, when you forgot to sudo edit.
cnoreabbrev w!! w !sudo tee % >/dev/null


" Previous.
nnoremap <silent> <f7> :prev<cr>
" Next.
nnoremap <silent> <f9> :next<cr>


" Open irb in a split terminal.
nnoremap <leader>irb :vsplit term://irb<cr>i


" Escape! (not sure what this is for...)
tnoremap <leader><esc> <c-\><c-n>


" Grepper
" search all files
nnoremap <leader>a :Grepper -tool ag<cr>
" search only open buffers
nnoremap <leader>A :Grepper -tool ag -buffers<cr>
" search for word under cursor
nnoremap <leader>w :Grepper -tool ag -cword -noprompt<cr>


" Map <leader>f to open CtrlP in buffer mode.
nnoremap <silent> <leader>f :CtrlPBuffer<cr>


" Undo Git hunk under cursor
nnoremap <leader>uh :GitGutterUndoHunk<cr>


" Close a buffer without closing the window.
nnoremap <silent> <leader>d :Bdelete<cr>


" Commentary.
xmap <leader>c <Plug>Commentary
nmap <leader>c <Plug>Commentary
nmap <leader>c<space> <Plug>CommentaryLine
nmap <leader>cu <Plug>CommentaryUndo


" Toggle NERDTree.
nnoremap <leader>tr :NERDTreeToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/site/plugged')

" colorschemes
" Plug 'KKPMW/oldbook-vim'
" Plug 'pgdouyon/vim-yin-yang'
" Plug 'athaeryn/vim-seahorse'
" Plug 'owickstrom/vim-colors-paramount'
" Plug 'sk1418/last256'
Plug 'EdenEast/nightfox.nvim'
" Plug 'huyvohcmc/atlas.vim'

Plug 'thaerkh/vim-indentguides'
Plug 'airblade/vim-gitgutter'
" Plug 'w0rp/ale'
" Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-grepper'
Plug 'chrisbra/NrrwRgn'
" Plug 'junegunn/vim-slash'
" Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'Olical/vim-enmasse', { 'on': 'EnMasse' }
Plug 'paradigm/TextObjectify'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/EasyGrep'
Plug 'int3/vim-extradite', { 'on': 'Extradite' }
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }

" Languages
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen' " clojure
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mustache/vim-mode', { 'for': 'mustache' }
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'jparise/vim-graphql' " graphql
Plug 'tikhomirov/vim-glsl' " glsl
Plug 'leafgarland/typescript-vim'
Plug 'rescript-lang/vim-rescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'

" LanguageClient
if has('nvim')
"   Plug 'autozimu/LanguageClient-neovim', {
"       \ 'branch': 'next',
"       \ 'do': 'bash install.sh',
"       \ }
"
  " (Optional) Multi-entry selection UI.
  Plug 'junegunn/fzf'

  Plug 'ncm2/ncm2'
  " ncm2 requires nvim-yarp
  Plug 'roxma/nvim-yarp'

  " enable ncm2 for all buffer
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " note that must keep noinsert in completeopt, the others is optional
  set completeopt=noinsert,menuone,noselect
endif

call plug#end()


"=========================================================="
" Colorscheme/highlights
"=========================================================="

set background=dark
colorscheme duskfox


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup FileTypes
  autocmd!

  " This makes editing crontab possible.
  " autocmd BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

  autocmd CmdwinEnter * nnoremap <buffer> <cr> <cr>
  autocmd FileType qf nnoremap <buffer> <cr> <cr>

  " No ColorColumn in Startify.
  autocmd FileType startify setlocal colorcolumn=""
  autocmd FileType startify setlocal nolist

  autocmd BufNewFile,BufRead *.mustache setl ft=mustache
  autocmd FileType mustache setlocal syntax=html

  autocmd BufNewFile,BufRead *.md setl ft=markdown

  autocmd BufNewFile,BufRead CMakeLists.txt set ft=cmake

  autocmd FileType rust nnoremap <f4> :vsp \| te cargo run<cr>

  autocmd FileType elm setl shiftwidth=4
augroup END


augroup Markdown
  autocmd!

  " Treat all text files as markdown.
  autocmd BufNewFile,BufRead *.{txt,text} set filetype=markdown

  " Wrap text for txt/markdown.
  autocmd FileType markdown set wrap linebreak textwidth=80
  autocmd FileType txt set wrap linebreak textwidth=80

  " Don't showbreak for txt/markdown.
  autocmd FileType markdown set showbreak=
  autocmd FileType txt set showbreak=

  " Enable spellcheck in Markdown.
  autocmd FileType markdown set spell

  " Convert Markdown to HTML (in place!).
  autocmd FileType markdown command! Html %! /usr/local/bin/markdown --html4tags <cr>
augroup END


" TODO: what to do with this?
augroup SpaceVim

  autocmd!

  " Resize splits on window resize.
  autocmd VimResized * exe "normal! \<c-w>="

  " Jump to last position in buffer when opening.
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                            \ exe "normal g'\"" | endif

  " For man pages:
  "   - don't show listchars
  "   - exit with q
  autocmd FileType man set nolist | nnoremap q :q!<cr>

  " This makes editing crontab possible.
  autocmd BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

  " Don't show listchars in git commit view or gitconfig, it's annoying.
  autocmd FileType gitcommit set nolist
  autocmd FileType gitconfig set nolist

  " Format json.
  autocmd FileType json command! Format %!python -m json.tool
  autocmd FileType json set conceallevel=0

augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format On Save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:format_on_save = 1
function! FormatToggle()
  if g:format_on_save == 1
    let g:format_on_save = 0
  else
    let g:format_on_save = 1
  endif
endfunction

function! FormatOnSave()
  if g:format_on_save == 1
    " exec \":Neoformat\"
    exec ":silent! call CocAction('format')"
  endif
endfunction

command! FormatToggle call FormatToggle()

function! LightineFormattingEnabled()
  return g:format_on_save == 1 ? 'format on' : 'format off'
endfunction

augroup fmt
  autocmd!
  autocmd BufWritePre * call FormatOnSave()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings & Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" The Silver Searcher
"
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in Ack.vim.
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache.
  let g:ctrlp_use_caching = 0
endif

let g:grepper = {}
let g:grepper.highlight = 1


"" CtrlP
"
" Open with <c-f>.
let g:ctrlp_map = '<c-f>'

" Increase file limit from 10,000 to 100,000.
let g:ctrlp_max_files = 100000

" Don't remember the last input.
let g:ctrlp_persistent_input = 0

" Don't change working directory.
let g:ctrlp_working_path_mode = 0

let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/]\.sass-cache'
            \ }

" Prevent opening a split beside the Startify buffer.
let g:ctrlp_reuse_window = 'startify'


"" Netrw
"
let g:netrw_liststyle=3
let g:netrw_browse_split=3
let g:netrw_preview=1
let g:netrw_winsize=20


"" Startify
"
let g:startify_bookmarks = [
  \ '~/.vimrc',
  \ '~/.zshrc'
\]
let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ '^/usr/local/Cellar/vim',
  \ '^/usr/local/Cellar/macvim'
\]
let g:startify_list_order = ['dir', 'bookmarks', 'sessions']
let g:startify_files_number = 10
let g:startify_change_to_dir = 0
let g:startify_relative_path = 1
let g:startify_custom_header = ['']
" let g:startify_custom_header = [
"   \ '',
"   \ '    ...................        .   .        ....................',
"   \ '        ................       .....       .................',
"   \ '          ...............|...|.|||||.|...|...............',
"   \ '           ..............|...|...|...||.||..............',
"   \ '            ..............|.|....|...|.|.|.............',
"   \ '           ................|...|||||.|...|..............',
"   \ '                            ...........',
"   \ '                               .....',
"   \ '                                ...',
"   \ '                                 .'
" \]

" let g:startify_custom_header =
"             \ map(split(system('node ~/code/athaeryn/terrarium/terrarium'), '\n'), '"   ". v:val')

" Let NERDTree use the Startify buffer
autocmd User Startified setlocal buftype=


"" NERDTree
"
let g:NERDTreeMinimalUI = 1

let NERDTreeIgnore=[
      \ '\~$',
      \ '\.bs\.js$',
      \ '\.bs\.mjs$',
      \ '\.res\.mjs$',
      \ '^public/thumbnails$'
      \ ]


"" Better Whitespace
"
let g:better_whitespace_enabled=0
let g:better_whitespace_filetypes_blacklist=[
      \ 'diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown',
      \ 'startify'
      \]


"" JSX
"
let g:jsx_ext_required = 0


"" Elm-vim
"
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0


"" HACK to keep vim-javascript from complaining for now
"
if !exists("b:undo_ftplugin") | let b:undo_ftplugin = '' | endif


"" Lightline
"
let g:lightline = {
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'format' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'format': 'LightineFormattingEnabled'
      \ },
      \ }


"" Don't highlight
let g:loaded_matchparen = 1


"" Neoformat
let g:neoformat_only_msg_on_error = 1


"" GitGutter
"
let g:gitgutter_sign_added = '░ '
let g:gitgutter_sign_modified = '░ '
let g:gitgutter_sign_removed = '░ '
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '░ '


"" Go
"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" Added this because of jonsmithers/vim-html-template-literals README
let g:html_indent_style1 = "inc"


"=========================================================="
" CoC
"=========================================================="

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

