" Settings {{{1

    " Environment {{{2

        " Use zsh
        set shell=zsh

        " Set terminal type
        set term=$TERM

        " All other encodings are bad
        set encoding=utf-8

        " Prevent Vim from clobbering the scrollback buffer. See
        " http://www.shallowsky.com/linux/noaltscreen.html
        " via Gary Bernhardt
        set t_ti= t_te=

        " NeoBundle {{{2

            if has('vim_starting')
            set runtimepath+=~/.vim/bundle/neobundle.vim/
            endif

            call neobundle#rc(expand('~/.vim/bundle/'))

            " Let NeoBundle manage NeoBundle
            NeoBundleFetch 'Shougo/neobundle.vim'

            " Load the bundles
            source ~/.vim/bundles.vim

            " Enable filetype plugins and indentation
            filetype plugin indent on

            NeoBundleCheck


    " Colorscheme {{{2

        " Use my terminal colors
        let g:hybrid_use_Xresources = 1

        " Use hybrid colorscheme
        colorscheme hybrid

        " Enable syntax highlighting
        syntax enable

        " Highlights {{{3

            " Startify {{{4

                hi StartifyBracket  ctermfg=8
                hi StartifyFile     ctermfg=15
                hi StartifyNumber   ctermfg=11
                hi StartifyPath     ctermfg=12
                hi StartifySlash    ctermfg=7
                hi StartifySpecial  ctermfg=2
                hi StartifyHeader   ctermfg=3
                hi StartifyFooter   ctermfg=8

            " Statusline {{{4

                " For some reason bg and fg are reversed for the statusline
                " groups..
                hi StatusLine    ctermfg=10  ctermbg=0
                hi StatusLineNC  ctermfg=8   ctermbg=0

                " Filename
                hi User1  ctermfg=0  ctermbg=7

                " Flags
                hi User2  ctermfg=9  ctermbg=0

            "Other {{{4

                " listchars
                hi SpecialKey ctermfg=1 ctermbg=15

                " TabLine
                hi TabLine cterm=underline ctermfg=8 ctermbg=0
                hi TabLineFill cterm=underline ctermfg=8 ctermbg=0
                hi TabLineSel cterm=underline ctermfg=0 ctermbg=8

                " Columns 'n' lines
                hi ColorColumn ctermbg=0
                hi CursorLine cterm=none ctermbg=0
                hi VertSplit cterm=none ctermbg=0 ctermfg=8

                " Italic comments
                hi Comment cterm=italic

                " Purple Search
                hi Search ctermfg=15 ctermbg=12

                " Purple highlights
                hi Visual ctermfg=15 ctermbg=13


    " Search {{{2

        " Searches should be case insensitive...
        set ignorecase

        " ...unless there is a capital letter
        set smartcase

        " Google... err... Vim Instant
        set incsearch
        set showmatch

        " Highlight all matches for the last used search pattern
        set hlsearch


    " Statusline {{{2

        " Clear the statusline
        set statusline=

        " Buffer number
        set statusline+=[%n]\ ""

        " User2 hilight
        set statusline+=%2*

        " Flags (h, [+], RO)
        set statusline+=%(\ %m%h%r\ %)

        " User1 highlight
        set statusline+=%1*

        " File name
        set statusline+=\ %f\ ""

        " Back to default highlight
        set statusline+=%*\ ""

        " Filetype
        set statusline+=%<[%{strlen(&ft)?&ft:'none'},

        " Encoding
        set statusline+=%{strlen(&fenc)?&fenc:&enc},

        " File format
        set statusline+=%{&fileformat}]

        " Right align the rest
        set statusline+=%=

        " Cursor line, column
        set statusline+=%-14.(%l,%c%V%)

        " Percent through file
        set statusline+=\ %P\ ""

    " Mouse {{{2

        " Enable mouse support in terminals that can handle it
        set mouse=a

    " Info {{{2

        " Do NOT beep
        set visualbell

        " Show tidbits of info in bottom right about current keyboard command
        set showcmd

        " Display the current mode in the status line
        set showmode

    " Indentation {{{2

        " Turn on auto-indentation, for better or worse
        set autoindent
        set smartindent
        set cindent

        " Use four space instead of a tab
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab

    " Folding {{{2

        " Set fold method to indent
        set foldmethod=indent

        " Don't fold by default
        set nofoldenable

        " From http://dhruvasagar.com/2013/03/28/vim-better-foldtext
        function! NeatFoldText()
            let regex = '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*'
            let line = ' ' .
                        \ substitute(getline(v:foldstart), regex, '', 'g') . ' '
            let lines_count = v:foldend - v:foldstart + 1
            let lines_count_text = '| ' .
                        \ printf("%10s", lines_count . ' lines') . ' |'
            let fill = matchstr(&fillchars, 'fold:\zs.')
            let foldtextstart = strpart('+' . repeat(fill, v:foldlevel*2) .
                        \ line, 0, (winwidth(0)*2)/3)
            let foldtextend = lines_count_text . repeat(fill, 8)
            let foldtextlength = strlen(substitute(foldtextstart . foldtextend,
                        \ '.', 'x', 'g')) + &foldcolumn
            return foldtextstart . repeat(fill, winwidth(0)-foldtextlength) .
                        \ foldtextend
        endfunction
        set foldtext=NeatFoldText()

    " Other {{{2
        " Force showing ten extra lines above and below cursor
        set scrolloff=5

        " Don't wrap text, but add characters indicating hidden parts of a line
        " and change horizontal scrolling to be sane
        set nowrap
        set sidescroll=1
        set sidescrolloff=1

        " Display line numbers
        set number

        " Don't let the numbers take up more space than necessary
        set numberwidth=1

        " Make command line 1 lines tall
        set cmdheight=1

        " If wrapping is enabled, mark wrapped lines
        " (comment is to prevent automatic trailing whitespace removal)
        set showbreak=\ »\ "

        " Don't redraw while executing macros
        set lazyredraw

        " Show listchars...
        set list
        " ...which are:
        set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:·

        " Highlight the line the cursor is in
        set cursorline

        " Display a colored column at 81 characters. Do not cross!
        set colorcolumn=81

        " Don't drop buffers even when no longer shown in a window
        set hidden

        " Always show the status line above the command line
        set laststatus=2

        " Make backspace also delete indents and line endings
        set backspace=indent,eol,start

        " No modelines
        set modelines=0

        " Where to put backup files
        set backupdir=~/.vim/backup

        " Stop littering .swp files everywhere
        set noswapfile
        " Put swapfiles in the backup directory
        set directory=~/.vim/backup

        " Reload a file that is modified from the outside
        set autoread

        " Keep a really long command/search history
        set history=1000

        " Make tab completion a lot smarter (this mostly makes it work like zsh)
        set wildmode=longest,list
        set wildmenu

        " Stores undo info in a file so that it persists after vim closes
        " Need to have ~/.vim/undo
        set undofile
        set undodir=~/.vim/undo

        " Gimme tab completion on .css-class-names and stuff
        set iskeyword+=-

        " Improve session saving
        set sessionoptions=blank,curdir,folds,help,tabpages,winpos

        " Don't show the startup message
        set shortmess=I

" Autocommands {{{1

    augroup Misc "{{{2

        autocmd!

        " Automatically fold everything when opening ~/.vimrc"
        autocmd BufRead .vimrc set fen

    augroup END


    augroup FileTypes "{{{2

        autocmd!

        " For man pages:
        "   - don't show listchars
        "   - exit with q
        autocmd FileType man set nolist | nnoremap q :q!<cr>

        " This makes editing crontab possible
        autocmd BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

        " Folding for vim files
        autocmd FileType vim set foldmethod=marker

        " Don't show listchars in git commit view or gitconfig, it's annoying
        autocmd FileType gitcommit set nolist
        autocmd FileType gitconfig set nolist

        autocmd CmdwinEnter * nnoremap <buffer> <cr> <cr>
        autocmd FileType qf nnoremap <buffer> <cr> <cr>

        autocmd FileType startify setlocal colorcolumn=""

        autocmd FileType json command! Format %!python -m json.tool

    augroup END

    augroup Markdown "{{{2

        autocmd!

        " Make all text files markdown
        autocmd BufNewFile,BufRead *.{txt,text} set filetype=markdown

        " Wrap text for txt/markdown
        autocmd FileType markdown set wrap linebreak textwidth=0
        autocmd FileType txt set wrap linebreak textwidth=0

        " Don't showbreak for txt/markdown
        autocmd FileType markdown set showbreak=
        autocmd FileType txt set showbreak=

    augroup END

" Functions {{{1

    " Rename Current File (Stolen from Gary Bernhardt)
    function! RenameFile()
        let old_name = expand('%')
        let new_name = input('New file name: ', expand('%'), 'file')
        if new_name != '' && new_name != old_name
            exec ':saveas ' . new_name
            exec ':silent !rm ' . old_name
            redraw!
        endif
    endfunction

    " Use Tab for indent if on a blank/whitespace line,
    " or completion if there is text entered (Stolen from Gary Bernhardt)
    function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        else
            return "\<c-p>"
        endif
    endfunction


    " Change the amount of space to insert in place of a tab
    function! TabSpaces (how_many)
        let &tabstop = a:how_many
        let &shiftwidth = a:how_many
        let &softtabstop = a:how_many
    endfunction

" Commands {{{1

    " Switch between 2 and 4 spaces for indentation
    command! TwoSpaces call TabSpaces(2)
    command! FourSpaces call TabSpaces(4)

    " Show the pipes screensaver
    command! Pipes !pipes

    " Search for todos with Ack
    command! Todos Ack TODO

    " Edit notes
    command! Notes edit ~/notes

    " Make the current window 80 cols wide
    command! Eighty vertical resize 80

    " Call concealerator
    command! ConcealToggle let &conceallevel=&conceallevel==0?2:0



" Abbreviations {{{1

    " Insert a timestamp
    iabbrev _d <c-r>=strftime('%H:%M -')<cr>

" Mappings {{{1

    " Leader {{{2
        " Change the leader key to comma
        let mapleader = ","
        let g:mapleader = ","

    " Splits {{{2

        " Shortcuts for creating splits
        nnoremap <leader>v <c-w>v<c-w>l<c-w>L
        nnoremap <leader>h <c-w>s<c-w>j

        " Easier split navigation
        nnoremap <c-h> <c-w>h
        nnoremap <c-j> <c-w>j
        nnoremap <c-k> <c-w>k
        nnoremap <c-l> <c-w>l

    " Tabs {{{2

        " New tab
        map <leader>tn :tabnew<cr>:Startify<cr>
        map <leader>tn :tabnew<cr>
        " Only tab
        noremap <leader>to :tabonly<cr>
        " Exit
        noremap <leader>te :tabclose<cr>

        " Navigation
        nnoremap <silent> <c-n> :tabnext<cr>
        nnoremap <silent> <c-p> :tabprev<cr>

    " Toggles... {{{2

        " ...spell checking
        noremap <leader>sp :setlocal spell!<cr>:setlocal spell?<cr>

        " ...paste mode
        noremap <leader>pp :set paste!<cr>:set paste?<cr>

        " ...NERDTree
        nnoremap <leader>tr :NERDTreeToggle<cr>

        " ...Tagbar
        nnoremap <f8> :TagbarToggle<cr>

        " ...Syntastic mode
        noremap <leader>sn :SyntasticToggleMode<cr>

        " ...display listchars
        nnoremap <leader>l :setl nolist!<cr>:set list?<cr>

        " ...text wrapping
        nnoremap <leader>wr :setl nowrap!<cr>:set wrap?<cr>

    " RainbowParentheses {{{2

        nnoremap <leader>rb :RainbowParenthesesToggle<cr>

    " Commentary {{{2

        xmap <leader>c <Plug>Commentary
        nmap <leader>c <Plug>Commentary
        nmap <leader>c<space> <Plug>CommentaryLine
        nmap <leader>cu <Plug>CommentaryUndo

    " SkyBison {{{2

        cnoremap <c-l> <c-r>=SkyBison("")<cr><cr>

    "Other {{{2

        " Shortcut to close a buffer without closing the window
        nnoremap <silent> <leader>d :Bdelete<cr>

        " Map <leader><leader> to switch to last buffer
        nnoremap <leader><leader> <c-^>

        " Add a line below in normal mode, stay in normal mode
        nnoremap <c-o> o<esc>0D

        " Make scroll up/down scroll faster
        noremap <c-e> 5<c-e>
        noremap <c-y> 5<c-y>

        " Always be magical. Very magical. Always.
        nnoremap / /\v
        vnoremap / /\v

        " Copy and paste from system clipboard
        noremap <leader>p "+p
        noremap <leader>y "+y

        " Sort! :D
        vnoremap <leader>st :sort<cr>

        " Clear highlighted search
        nnoremap <enter> :noh<cr>

        " Rename the current file
        noremap <leader>n :call RenameFile()<cr>

        " For InsertTabWrapper()
        inoremap <tab> <c-r>=InsertTabWrapper()<cr>

        " Keep the selection when indenting
        vnoremap < <gv
        vnoremap > >gv

        " Write as root, when you forgot to sudo edit
        cnoreabbrev w!! w !sudo tee % >/dev/null

        " For navigating wrapped lines
        nnoremap j gj
        nnoremap k gk
        vnoremap j gj
        vnoremap k gk

        " Convert Markdown to HTML
        nnoremap <leader>md :%! /usr/local/bin/markdown --html4tags <cr>

        " Map <leader>f to open CtrlP in buffer mode
        nnoremap <silent> <leader>f :CtrlPBuffer<cr>

        " Repeat the last :! command
        nnoremap <c-c> :!!<cr>

        " Display errors
        nnoremap <leader>er :Errors<cr>

        " Inspect highlight under cursor
        nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
        \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

        " Remove trailing whitespace
        nnoremap <leader>rw :%s/\s\+$//e<cr>:noh<cr>

        " Refresh the split to the right
        nnoremap <leader>rr :wincmd w \| edit \| wincmd p<cr>

        " Ack.vim
        nnoremap <leader>a :Ack<space>

        " Dispatch rspec
        nnoremap <leader>rs :Dispatch bundle exec rspec<cr>


" Plugins {{{1

    " Ack {{{2

        " Use the Silver Searcher
        let g:ackprg = 'ag --nogroup --nocolor --column'

    " CtrlP {{{2

        " Use <c-f> as the mapping for CtrlP
        let g:ctrlp_map = '<c-f>'

        " Increase CtrlP file limit from 10,000 to 100,000
        let g:ctrlp_max_files = 100000

        " CtrlP should ignore dot files
        " let g:ctrlp_dotfiles = 1

        " CtrlP shouldn't remember the last input
        let g:ctrlp_persistent_input = 0

        " Don't let CtrlP change working directory
        let g:ctrlp_working_path_mode = 0

        let g:ctrlp_custom_ignore = {
                    \ 'dir': '\v[\/]\.sass-cache'
                    \ }

        " Prevent CtrlP opening a split beside the Startify buffer
        let g:ctrlp_reuse_window = 'startify'

        " Use ag if we got it
        if executable('ag')
          " Use the silver searcher
          let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
          " Also set :grep to use ag
          set grepprg=ag\ --nogroup\ --nocolor

          " ag is fast enough that CtrlP doesn't need to cache
          let g:ctrlp_use_caching = 0
        endif

    " NERDTree {{{2


    " Netrw {{{2

        let g:netrw_liststyle=3
        let g:netrw_browse_split=3
        let g:netrw_preview=1
        let g:netrw_winsize=20


    " Startify {{{2

        let g:startify_bookmarks = [
                    \ '~/.vimrc',
                    \ '~/.zshrc',
                    \ '~/.vim/bundles.vim',
                    \ '/usr/local/etc/nginx/nginx.conf',
                    \ '~/notes'
                    \]
        let g:startify_skiplist = ['COMMIT_EDITMSG', '^/usr/local/Cellar/vim', '^/usr/local/Cellar/macvim']
        let g:startify_list_order = ['files', 'bookmarks', 'sessions']
        let g:startify_files_number = 10
        let g:startify_change_to_dir = 0
        let g:startify_custom_header = [
                    \ '',
                    \ '    -------------------        -   -        --------------------',
                    \ '        ----------------       -----       -----------------',
                    \ '          ---------------█---█-█████-█---█---------------',
                    \ '           --------------█---█---█---██-██--------------',
                    \ '            --------------█-█----█---█-█-█-------------',
                    \ '           ----------------█---█████-█---█--------------',
                    \ '                            -----------',
                    \ '                               -----',
                    \ '                                ---',
                    \ '                                 -'
                    \ ]
        let g:startify_custom_footer = ['', ''] + map(split(system('tips'), '\n'), '"    ".v:val')

    " Syntastic {{{2

        " Enable syntastic error signs in the line number column
        let g:syntastic_enable_signs = 1

        " Don't make life so easy
        let g:syntastic_javascript_jslint_conf = ""