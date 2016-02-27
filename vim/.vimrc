set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on      " load filetype-specific indent files

set number              " show line numbers
set showcmd             " show command in bottom bar
set showmode " current mode in status line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

" move vertically by visual line
nnoremap j gj
nnoremap k gk

autocmd Filetype gitcommit setlocal spell textwidth=72

