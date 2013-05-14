" NOTES {{{

    " Established Jan 2013.
    " My starting point was Dan Menssen's .vimrc. (https://github.com/menssen)

"}}}

" Settings {{{

    " Environment {{{

        " Disable vi-compatibility right off the bat
        set nocompatible

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

        " Enable filetype plugins
        filetype plugin indent on

        " Pathogen Bundle Manager
        call pathogen#infect()

    "}}}

    " Colorscheme {{{

        let g:hybrid_use_Xresources = 1
        colorscheme hybrid

        " Enable syntax highlighting
        syntax enable

        " Highlights {{{

            " Startify
            hi StartifyBracket  ctermfg=8
            hi StartifyFile     ctermfg=15
            hi StartifyNumber   ctermfg=11
            hi StartifyPath     ctermfg=12
            hi StartifySlash    ctermfg=7
            hi StartifySpecial  ctermfg=2

            " (User1: filename, User2: flags)
            " For some reason bg and fg are reversed for the statusline groups..
            hi StatusLine    ctermfg=8  ctermbg=0
            hi StatusLineNC  ctermfg=235  ctermbg=243
            hi User1         ctermfg=0   ctermbg=15
            hi User2         ctermfg=9   ctermbg=0

            " listchars
            hi SpecialKey ctermfg=red ctermbg=white

        "}}}

    "}}}

    " Search {{{

        " Searches should be case insensitive...
        set ignorecase
        " ...unless there is a capital letter
        set smartcase

        " Google... err... Vim Instant
        set incsearch
        set showmatch

    "}}}

    " Force showing five extra lines above and below cursor
    set scrolloff=10

    " Don't wrap text, but add characters indicating hidden parts of a line
    " and change horizontal scrolling to be sane
    set nowrap
    set sidescroll=1
    set sidescrolloff=1
    set listchars=extends:>,precedes:<

    " Display line numbers
    set number

    " Make command line 2 lines tall
    set cmdheight=2

    " If wrapping is enabled, mark wrapped lines
    " Comment is to prevent automatic trailing whitespace removal
    set showbreak=\ ->\ "

    " Don't redraw while executing macros
    set lazyredraw

    " Show listchars...
    set list
    " ...which are:
    set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:·

    " Highlight all matches for the last used search pattern
    set hlsearch

    " Highlight the line the cursor is in
    set cursorline

    " Display a colored column at 81 characters. Do not cross
    set colorcolumn=81

    " Hang on to a buffer even when no longer shown in a window
    set hidden

    " Always show the status line above the command line
    set laststatus=2

    " Shrink inactive splits to 10 rows and 20 cols
    " Considering getting rid of this...
    set winwidth=20
    set winminwidth=20
    set winwidth=120
    set winheight=10
    set winminheight=10
    set winheight=999

    " Statusline {{{

        set statusline=                               " Clear the statusline
        set statusline+=[%n]                          " Buffer number
        set statusline+=%2*\                          " Back to default hilight
        set statusline+=%1*                           " User1 highlight
        set statusline+=\ %f\                         " File name
        set statusline+=%2*                           " Back to default hilight
        set statusline+=\ %(%m%h%r\ %)                " Flags (h, [+], RO)
        set statusline+=%*\                           " Back to default hilight
        set statusline+=%<[%{strlen(&ft)?&ft:'none'}, " Filetype
        set statusline+=%{strlen(&fenc)?&fenc:&enc},  " Encoding
        set statusline+=%{&fileformat}]               " File format
        set statusline+=%=                            " Right align the rest
        set statusline+=%-14.(%l,%c%V%)               " Cursor line, column
        set statusline+=\ %P                          " Percent through file

    "}}}

    " Mouse {{{

        " Enable mouse support in terminals that can handle it (iTerm can,
        " Terminal.app can't)
        set mouse=a

    "}}}

    " Info {{{

        " Do NOT beep
        set visualbell

        " Show the cursor position at the end of the status line
        set ruler

        " Show tidbits of info in bottom right about current keyboard command
        set showcmd

        " Display the current mode in the status line
        set showmode

    "}}}



    " Make backspace also delete indents and line endings
    set backspace=indent,eol,start

    " Indentation {{{

        " Turn on auto-indentation, for better or worse
        set autoindent
        set smartindent

        " Use four space instead of a tab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set expandtab

    "}}}

    " Folding {{{

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

    "}}}


    " Kill some security exploits and also modelines are a dumb idea
    set modelines=0

    " Where to put backup files
    set backupdir=~/.vim/backup

    " Reload a file that is modified from the outside
    set autoread

    " Stop littering .swp files everywhere
    set noswapfile

    " Put swapfiles in the backup directory
    set directory=~/.vim/backup

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

"}}}

" Autocommands {{{

    augroup Misc "{{{

        autocmd!

        " Hello good-bye
        autocmd VimEnter * echo "Hello"
        autocmd VimLeave * echo "Good-bye"

        " Close a quickfix window with q
        autocmd BufNewFile,BufRead *
                    \ if &buftype == "quickfix" |
                    \     nnoremap q :lclose<cr> |
                    \ endif

        " Files should open with cursor at same line as when closed
        " From vim docs, via Gary Bernhardt
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \     exe "normal g`\"" |
                    \ endif

    augroup END "}}}

    augroup FileTypes "{{{

        autocmd!

        " For man pages:
        "   - don't show listchars
        "   - exit with q
        autocmd FileType man set nolist | nnoremap q :q!<cr>

        " This makes editing crontab possible
        autocmd BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

        " .bf means brainfuck
        autocmd BufNewFile,BufRead *.bf set filetype=brainfuck

        " Folding for vim files
        autocmd FileType vim set foldmethod=marker

    augroup END "}}}

    augroup Markdown "{{{

        " Make all text files markdown
        autocmd BufNewFile,BufRead *.{txt,text} set filetype=markdown

        " Wrap text for txt/markdown
        autocmd FileType markdown set wrap linebreak textwidth=0
        autocmd FileType txt set wrap linebreak textwidth=0

        " Don't showbreak for txt/markdown
        autocmd FileType markdown set showbreak=
        autocmd FileType txt set showbreak=

    augroup END "}}}

"}}}

" Functions {{{

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

    " Revert the file
    function! Revert ()
        if confirm("Revert?", "&Yes\n&No", 2) == 1
            edit!
        endif
        return
    endfunction

    " Change the amount of space to insert in place of a tab
    function! TabSpaces (how_many)
        let &tabstop = a:how_many
        let &shiftwidth = a:how_many
        let &softtabstop = a:how_many
    endfunction

"}}}

" Mappings {{{

    " Change the leader key to comma
    let mapleader = ","
    let g:mapleader = ","

    " Splits {{{

        " Shortcuts for creating splits
        " Show Startify by default...
        nnoremap <leader>v <c-w>v<c-w>l<c-w>L:Startify<cr>
        nnoremap <leader>h <c-w>s<c-w>j:Startify<cr>
        " ...or not with capital V and H
        nnoremap <leader>V <c-w>v<c-w>l<c-w>L
        nnoremap <leader>H <c-w>s<c-w>j

        " Easier split navigation
        nnoremap <c-h> <c-w>h
        nnoremap <c-j> <c-w>j
        nnoremap <c-k> <c-w>k
        nnoremap <c-l> <c-w>l

    "}}}

    " Tabs {{{

        " New tab (show Startify)
        map <leader>tn :tabnew<cr>:Startify<cr>
        " Only tab
        noremap <leader>to :tabonly<cr>
        " Exit
        noremap <leader>te :tabclose<cr>

        " Navigation
        nnoremap <silent> <c-n> :tabnext<cr>
        nnoremap <silent> <c-p> :tabprev<cr>
        inoremap <silent> <c-n> <esc><c-n>
        inoremap <silent> <c-p> <esc><c-p>

    "}}}

    " Toggles... {{{

        " ...spell checking
        noremap <leader>sl :setlocal spell!<cr>:setlocal spell?<cr>

        " ...paste mode
        noremap <leader>pp :set paste!<cr>:set paste?<cr>

        " ...NERDTree
        nnoremap <leader>tr :NERDTreeToggle<cr>

        " ...textwrap
        nnoremap <leader>w :set nowrap!<cr>:set wrap?<cr>

        " ...Syntastic mode
        noremap <leader>sn :SyntasticToggleMode<cr>

        " ...display listchars
        nnoremap <leader>l :setl nolist!<cr>:set list?<cr>

    "}}}

    " Shortcut to close a buffer without closing the window
    nnoremap <silent> <leader>d :Bclose<cr>

    " Map <leader><leader> to switch to last buffer
    nnoremap <leader><leader> <c-^>

    " Add a line below in normal mode, stay in normal mode
    nnoremap <c-o> o<esc>

    " Add a blank line below in normal mode, stay in normal mode
    nnoremap <c-o> o<esc>0D

    " Make scroll up/down scroll faster
    noremap <c-e> 5<c-e>
    noremap <c-y> 5<c-y>

    " Always be magical. Very magical. Always.
    nnoremap / /\v
    vnoremap / /\v

    " Open a file in the same directory as the current file
    " (Stolen from Gary Bernhardt)
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    noremap <leader>ee :edit %%

    " Copy and paste from system clipboard
    noremap <leader>p "+p
    noremap <leader>y "+y

    " Sort! :D
    vnoremap <leader>s :sort<cr>

    " Clear highlighted search
    nnoremap <enter> :noh<cr>

    " Friends don't let friends use the arrow keys
    noremap <up> <nop>
    noremap <down> <nop>
    noremap <left> <nop>
    noremap <right> <nop>

    " Map F12 to revert (like Photoshop)
    noremap <f12> :call Revert()<cr>

    " Insert spaces in Normal mode
    nnoremap <space> i<space><esc>l

    " Rename the current file
    noremap <leader>n :call RenameFile()<cr>

    " For InsertTabWrapper()
    inoremap <tab> <c-r>=InsertTabWrapper()<cr>
    " Omnicomplete uses shift-tab
    inoremap <s-tab> <c-n>

    " For quick .vimrc hacking
    noremap \v :tabnew ~/.vimrc<cr>

    " jj or kj leaves insert mode, staying in place
    inoremap jj <esc>l
    inoremap kj <esc>l

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

    " Open the current directory in Finder
    nnoremap <silent> <c-d> :!open .<cr>

    " Inspect highlight under cursor
    map <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

    " Remove trailing whitespace
    noremap <leader>rw :%s/\s\+$//e<cr>

"}}}

" Plugins {{{

    " CtrlP {{{

        " Set CtrlP map to ctrl-f because it's easier to hit
        let g:ctrlp_map = '<c-f>'

        " Increase CtrlP file limit from 10,000 to 100,000
        let g:ctrlp_max_files = 100000

        " CtrlP should ignore dot files
        let g:ctrlp_dotfiles = 1

        " CtrlP shouldn't remember the last input
        let g:ctrlp_persistent_input = 0

        " Don't let CtrlP change working directory
        let g:ctrlp_working_path_mode = 0

        " CtrlP should ignore the cache directory (symfony)
        set wildignore+=*/app/cache/*
        " And the build directory (xcode)
        set wildignore+=*/build/*

    "}}}

    " Startify {{{

        let g:startify_bookmarks = [
                    \ '~/.vimrc',
                    \ '~/.zshrc',
                    \ '/usr/local/etc/nginx/nginx.conf'
                    \]
        let g:startify_skiplist = ['COMMIT_EDITMSG', '^/usr/local/Cellar/vim']

    "}}}

    " Syntastic {{{

        " Enable syntastic error signs in the line number column
        let g:syntastic_enable_signs = 1

        " Check for errors when opening a file
        let g:syntastic_check_on_open = 1

    "}}}

"}}}

