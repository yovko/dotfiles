" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn on syntax highlighting
syntax on

" Show line numbers
"set number

" Show file stats
set ruler

" Set shift width to 2 spaces.
set shiftwidth=2

" Set tab width to 2 columns.
set tabstop=2
set softtabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
"set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=3

" Do not wrap lines. Allow long lines to extend as far as the line goes.
"set nowrap
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
"set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
"set wildmode=list:longest
set wildmode=longest:full,full

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Whitespace
set textwidth=79
set formatoptions=tcqrn1
set noshiftround
set autoindent
set smartindent

set backspace=indent,eol,start

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Blink cursor on error instead of beeping (grr)
"set visualbell

" Encoding
set encoding=utf-8

" Rendering
set ttyfast

" Searching
"nnoremap / /\v
"vnoremap / /\v
map <leader><space> :let @/=''<cr> " clear search

" Use fzf in Vim (Apple Silicon)
set rtp+=/opt/homebrew/opt/fzf
" Use fzf in Vim (Apple Intel)
"set rtp+=/usr/local/opt/fzf

" Show the status on the second to last line.
set laststatus=2

" STATUS LINE (without plugins) ------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
"set statusline=
" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
"set statusline+=%=
" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" }}}

" This status line requires plugins https://github.com/itchyny/lightline.vim
" and https://github.com/itchyny/vim-gitbranch
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
