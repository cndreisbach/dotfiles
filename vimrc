" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

call pathogen#runtime_append_all_bundles() 

set t_Co=256
set exrc

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set incsearch                     " Highlight matches as you type.
"set hlsearch                      " Highlight matches.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set autoindent

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Word wrapping
set wrap
set linebreak
set display+=lastline
set textwidth=0
set wrapmargin=0

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let g:fugitive_git_executable="/usr/local/bin/git"

map , <leader>

map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Ctrl-S to save
map <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>i

" Show trailing spaces
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

map <leader>f :FufFile<cr>
map <leader>h :FufFileWithCurrentBufferDir<cr>
map <leader>b :FufBuffer<cr>

map <C-f> :Ack<space>

au BufNewFile,BufRead *.md set filetype=mkd
au BufNewFile,BufRead *.mkd set filetype=mkd
au BufNewFile,BufRead *.p6 set filetype=perl6
au BufNewFile,BufRead *.asciidoc set filetype=asciidoc
