" Settings {{{1

    " Environment {{{2

        " Use zsh.
        set shell=zsh

        set encoding=utf-8

        " Prevent Vim from clobbering the scrollback buffer.
        " http://www.shallowsky.com/linux/noaltscreen.html
        " via Gary Bernhardt
        set t_ti= t_te=


        syntax on

        " Enable filetype plugins and indentation.
        filetype plugin indent on

        " Set some gui options for MacVim.
        if has('gui_running')
          set titlestring=
          set titlestring+=%f\       " file name
          set titlestring+=%h%m%r%w  " flags
          set titlestring+=\ >\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory

          set guioptions=gmtc
          set antialias

          if has('mac')
            set macmeta
            set guifont=Fira\ Mono\ OT:h13
            set fuoptions=maxvert,maxhorz
          endif
        else
          " Set terminal type.
          set term=$TERM
        endif

    " Colorscheme {{{2

        " Use seahorse.
        set background=light
        colorscheme seahorse

        " Enable syntax highlighting.
        syntax enable

        " Highlights {{{3

            " Startify {{{4

                hi! link StartifyBracket Grey
                hi! link StartifyFile    Black
                hi! link StartifyNumber  Blue
                hi! link StartifyPath    Grey
                hi! link StartifySlash   Grey
                hi! link StartifySpecial Grey
                hi! link StartifyHeader  Yellow

            " Statusline {{{4

                " Filename
                hi! link User1 LightGreyBg

                " Flags
                hi! link User2 YellowBg

            " NERDTree {{{4

                " Directory
                hi! link NERDTreeUp Comment
                hi! link NERDTreeDir Comment
                hi! link NERDTreeDirSlash Comment

            "Other {{{4

                " TabLine
                " hi TabLine cterm=underline ctermfg=8 ctermbg=0
                " hi TabLineFill cterm=underline ctermfg=8 ctermbg=0
                " hi TabLineSel cterm=underline ctermfg=0 ctermbg=8

                " Columns 'n' lines
                " hi ColorColumn ctermbg=0
                " hi CursorLine cterm=none ctermbg=0
                " hi VertSplit cterm=none ctermbg=0 ctermfg=8


              "Vim {{{4

                hi! link vimString String


    " Search {{{2

        set ignorecase " Searches should be case insensitive...
        set smartcase  " unless there's a capital letter.

        " Start searching instantly.
        set incsearch
        set showmatch

        " Highlight all matches for the last used search pattern.
        set hlsearch


    " Statusline {{{2

        " Clear the statusline.
        set statusline=

        " Buffer number.
        set statusline+=[%n]\ ""

        " User2 hilight.
        set statusline+=%2*

        " Flags (h, [+], RO).
        set statusline+=%(\ %m%h%r\ %)

        " User1 highlight.
        set statusline+=%1*

        " File name.
        set statusline+=\ %f\ ""

        " Back to default highlight.
        set statusline+=%*\ ""

        " Filetype.
        set statusline+=%<[%{strlen(&ft)?&ft:'none'},

        " Encoding.
        set statusline+=%{strlen(&fenc)?&fenc:&enc},

        " File format.
        set statusline+=%{&fileformat}]

        " Right align the rest.
        set statusline+=%=

        " Cursor line, column.
        set statusline+=%-14.(%l,%c%V%)

        " Percent through file.
        set statusline+=\ %P\ ""

    " Mouse {{{2

        " Enable mouse support in terminals that can handle it.
        set mouse=a

    " Info {{{2

        " Please don't beep.
        set visualbell

        " Show info about current command in bottom right.
        set showcmd

        " Display the current mode in the status line.
        set showmode

    " Indentation {{{2

        " Turn on auto-indentation.
        set autoindent
        set smartindent
        set cindent

        " Use two spaces instead of a tab.
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab

    " Folding {{{2

        " Set fold method to indent.
        set foldmethod=indent

        " Don't fold by default.
        set nofoldenable

        " From http://dhruvasagar.com/2013/03/28/vim-better-foldtext.
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
        " Show five extra lines above and below cursor.
        set scrolloff=5

        " Don't wrap text, but add characters indicating hidden parts of a
        " line and change horizontal scrolling to be sane.
        set nowrap
        set sidescroll=1
        set sidescrolloff=1

        " Display line numbers.
        set number
        " Don't let the numbers take up more space than necessary.
        set numberwidth=1

        " Make command line 1 lines tall.
        set cmdheight=1

        " If wrapping is enabled, mark wrapped lines.
        set showbreak=\ »\ 

        " Don't redraw while executing macros.
        set lazyredraw

        " Show listchars...
        set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:·
        set list

        " Highlight the cursor line.
        set cursorline

        " Display a colored column at 81 characters. Do not cross!
        set colorcolumn=81

        " Don't drop buffers when no longer shown in a window.
        set hidden

        " Always show the status line above the command line.
        set laststatus=2

        " Make backspace also delete indents and line endings.
        set backspace=indent,eol,start

        " No modelines.
        set modelines=0

        " Backup...
        set backupdir=~/.vim/backup " ...backup files
        set directory=~/.vim/backup " ...swapfiles
        set undodir=~/.vim/undo

        " Stop littering .swp files everywhere.
        set noswapfile
        " Stores undo info in a file so that it persists after vim closes.
        set undofile

        " Reload a file that is modified from the outside.
        set autoread

        " Keep a really long command/search history.
        set history=1000

        " Make tab completion a lot smarter (mostly works like zsh).
        set wildmode=longest,list
        set wildmenu

        " Gimme tab completion on .css-class-names and stuff.
        " This should maybe go in an autocommand...
        set iskeyword+=-

        " Improve session saving.
        set sessionoptions=blank,curdir,folds,help,tabpages,winpos

        " Don't show the startup message.
        set shortmess=I

" Autocommands {{{1

    augroup Misc "{{{2

        autocmd!

        " Automatically fold everything when opening ~/.vimrc.
        autocmd BufRead .vimrc set foldenable

    augroup END


    augroup FileTypes "{{{2

        autocmd!

        " For man pages:
        "   - don't show listchars
        "   - exit with q
        autocmd FileType man set nolist | nnoremap q :q!<cr>

        " This makes editing crontab possible.
        autocmd BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

        " Folding for vim files.
        autocmd FileType vim set foldmethod=marker

        " Don't show listchars in git commit view or gitconfig, it's annoying.
        autocmd FileType gitcommit set nolist
        autocmd FileType gitconfig set nolist

        autocmd CmdwinEnter * nnoremap <buffer> <cr> <cr>
        autocmd FileType qf nnoremap <buffer> <cr> <cr>

        " No ColorColumn in Startify.
        autocmd FileType startify setlocal colorcolumn=""

        " Format json.
        autocmd FileType json command! Format %!python -m json.tool

    augroup END

    augroup Markdown "{{{2

        autocmd!

        " Treat all text files as markdown.
        autocmd BufNewFile,BufRead *.{txt,text} set filetype=markdown

        " Wrap text for txt/markdown.
        autocmd FileType markdown set wrap linebreak textwidth=0
        autocmd FileType txt set wrap linebreak textwidth=0

        " Don't showbreak for txt/markdown.
        autocmd FileType markdown set showbreak=
        autocmd FileType txt set showbreak=

        " Convert Markdown to HTML (in place!).
        autocmd FileType markdown command! Html %! /usr/local/bin/markdown --html4tags <cr>

    augroup END

" Functions {{{1

    " Rename current file (stolen from Gary Bernhardt).
    function! RenameFile()
        let old_name = expand('%')
        let new_name = input('New file name: ', expand('%'), 'file')
        if new_name != '' && new_name != old_name
            exec ':saveas ' . new_name
            exec ':silent !rm ' . old_name
            redraw!
        endif
    endfunction

    " Use tab for indent if on a blank/whitespace line,
    " or completion if there is text entered (stolen from Gary Bernhardt).
    function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        else
            return "\<c-p>"
        endif
    endfunction


    " Change the number of spaces to insert in place of a tab.
    function! TabSpaces (how_many)
        let &tabstop = a:how_many
        let &shiftwidth = a:how_many
        let &softtabstop = a:how_many
    endfunction

" Commands {{{1

    " Switch to 2 or 4 spaces for indentation.
    command! TwoSpaces call TabSpaces(2)
    command! FourSpaces call TabSpaces(4)

    " Search for todos with Ack.
    command! Todos Ack TODO

    " Edit notes.
    command! Notes edit ~/notes

    " Make the current window 80 cols wide.
    command! Eighty vertical resize 80

    " Concealerator.
    command! ConcealToggle let &conceallevel=&conceallevel==0?2:0



" Abbreviations {{{1

    " Insert a timestamp.
    iabbrev _d <c-r>=strftime('%H:%M -')<cr>



" Mappings {{{1

    " Leader {{{2

        " Change the leader key to comma.
        let mapleader = ","
        let g:mapleader = ","

    " Splits {{{2

        " Shortcuts for creating splits.
        nnoremap <leader>v <c-w>v<c-w>l<c-w>L
        nnoremap <leader>h <c-w>s<c-w>j

        " Easier split navigation.
        nnoremap <c-h> <c-w>h
        nnoremap <c-j> <c-w>j
        nnoremap <c-k> <c-w>k
        nnoremap <c-l> <c-w>l

    " Tabs {{{2

        " New tab.
        map <leader>tn :tabnew<cr>

        " Tab navigation.
        nnoremap <silent> <c-n> :tabnext<cr>
        nnoremap <silent> <c-p> :tabprev<cr>

    " Toggle... {{{2

        " ...spell checking
        noremap <leader>sp :setlocal spell!<cr>:setlocal spell?<cr>

        " ...NERDTree
        nnoremap <leader>tr :NERDTreeToggle<cr>

        " ...Tagbar
        nnoremap <f11> :TagbarToggle<cr>

        " ...Syntastic mode (active/passive)
        noremap <leader>sn :SyntasticToggleMode<cr>

        " ...display listchars
        nnoremap <leader>l :setl nolist!<cr>:set list?<cr>

        " ...text wrapping
        nnoremap <leader>wr :setl nowrap!<cr>:set wrap?<cr>

        " ...RainbowParentheses
        nnoremap <leader>rb :RainbowParenthesesToggle<cr>

    " Commentary {{{2

        xmap <leader>c <Plug>Commentary
        nmap <leader>c <Plug>Commentary
        nmap <leader>c<space> <Plug>CommentaryLine
        nmap <leader>cu <Plug>CommentaryUndo

    " SkyBison {{{2

        cnoremap <c-l> <c-r>=SkyBison("")<cr><cr>

    "Other {{{2

        " Close a buffer without closing the window.
        nnoremap <silent> <leader>d :Bdelete<cr>

        " Switch to last buffer.
        nnoremap <leader><leader> <c-^>

        " Add a line below in normal mode and stay in normal mode.
        nnoremap <c-o> o<esc>

        " Scroll up/down scroll faster.
        noremap <c-e> 5<c-e>
        noremap <c-y> 5<c-y>

        " Always be magical. Very magical. Always.
        nnoremap / /\v
        vnoremap / /\v
        nnoremap ? ?\v
        vnoremap ? ?\v

        " Copy and paste from system clipboard.
        noremap <leader>p "+p
        noremap <leader>y "+y

        " Clear highlighted search.
        nnoremap <cr> :noh<cr>

        " InsertTabWrapper (for autocomplete).
        inoremap <tab> <c-r>=InsertTabWrapper()<cr>

        " Keep the selection when indenting.
        vnoremap < <gv
        vnoremap > >gv

        " Write as root, when you forgot to sudo edit.
        cnoreabbrev w!! w !sudo tee % >/dev/null

        " Navigate wrapped lines.
        nnoremap j gj
        nnoremap k gk
        vnoremap j gj
        vnoremap k gk

        " Map <leader>f to open CtrlP in buffer mode.
        nnoremap <silent> <leader>f :CtrlPBuffer<cr>

        " Repeat the last :! command.
        nnoremap <c-c> :!!<cr>

        " Previous.
        nnoremap <silent> <f7> :prev<cr>
        " Next.
        nnoremap <silent> <f9> :next<cr>

        " Inspect highlight under cursor.
        nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
        \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

        " Remove trailing whitespace (except when escaped).
        nnoremap <leader>rw :%s/[^\\]\s\+$//e<cr>:noh<cr>

        " Ack.vim.
        nnoremap <leader>a :Ack<space>


" Plugins {{{1

    " Ack {{{2

        " Use the Silver Searcher.
        let g:ackprg = 'ag --nogroup --nocolor --column'

    " CtrlP {{{2

        " Open with <c-f>.
        let g:ctrlp_map = '<c-f>'

        " Increase file limit from 10,000 to 100,000.
        let g:ctrlp_max_files = 100000

        " Ignore dot files.
        " let g:ctrlp_dotfiles = 1

        " Don't remember the last input.
        let g:ctrlp_persistent_input = 0

        " Don't change working directory.
        let g:ctrlp_working_path_mode = 0

        let g:ctrlp_custom_ignore = {
                    \ 'dir': '\v[\/]\.sass-cache'
                    \ }

        " Prevent opening a split beside the Startify buffer.
        let g:ctrlp_reuse_window = 'startify'

        " Use ag if it's available.
        if executable('ag')
          let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
          " Also set :grep to use ag
          set grepprg=ag\ --nogroup\ --nocolor

          " ag is fast enough that CtrlP doesn't need to cache.
          let g:ctrlp_use_caching = 0
        endif

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
                    \ '    ░░░░░░░░░░░░░░░░░░░        ░   ░        ░░░░░░░░░░░░░░░░░░░░',
                    \ '        ░░░░░░░░░░░░░░░░       ░░░░░       ░░░░░░░░░░░░░░░░░',
                    \ '          ░░░░░░░░░░░░░░░▓░░░▓░▓▓▓▓▓░▓░░░▓░░░░░░░░░░░░░░░',
                    \ '           ░░░░░░░░░░░░░░▓░░░▓░░░▓░░░▓▓░▓▓░░░░░░░░░░░░░░',
                    \ '            ░░░░░░░░░░░░░░▓░▓░░░░▓░░░▓░▓░▓░░░░░░░░░░░░░',
                    \ '           ░░░░░░░░░░░░░░░░▓░░░▓▓▓▓▓░▓░░░▓░░░░░░░░░░░░░░',
                    \ '                            ░░░░░░░░░░░',
                    \ '                               ░░░░░',
                    \ '                                ░░░',
                    \ '                                 ░'
                    \ ]
        let g:startify_custom_footer = ['', ''] + map(split(system('tips'), '\n'), '"    ".v:val')

    " Syntastic {{{2

        " Enable syntastic error signs in the line number column.
        let g:syntastic_enable_signs = 1
