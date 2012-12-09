set nocompatible                  " Must come first because it changes other options.

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "gmarik/vundle"

" Utilities
Bundle "IndentAnything"
Bundle "airblade/vim-rooter"
Bundle "ervandew/supertab"
Bundle "msanders/snipmate.vim"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-surround"
Bundle "yankstack"
Bundle "mattn/zencoding-vim"

" ack.vim
Bundle "mileszs/ack.vim"
let g:ackprg="ack -i -H --nocolor --nogroup --column"

" Ctrl-P
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so
Bundle "kien/ctrlp.vim"
map <C-b> :CtrlPBuffer<cr>

" Commenting
Bundle "tomtom/tcomment_vim"
map <leader>c :TComment<cr>

" Fugitive
let g:fugitive_git_executable="/usr/local/bin/git"
Bundle "tpope/vim-fugitive"

" Tags
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
Bundle "taglist.vim"

" Rails
Bundle "tpope/vim-rails"
Bundle "danchoi/rails31nav.vim"

" Clojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1
Bundle "VimClojure"

" Slime
let g:slime_target = "tmux"
Bundle "jpalardy/vim-slime"

" Syntax
Bundle "othree/html5-syntax.vim"
Bundle "pangloss/vim-javascript"
Bundle "briancollins/vim-jst"
Bundle "tpope/vim-haml"
Bundle "kchmck/vim-coffee-script"
Bundle "jade.vim"
Bundle "asciidoc.vim"
Bundle "Markdown"

if has("autocmd")
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.mkd set filetype=markdown
  autocmd BufNewFile,BufRead *.p6 set filetype=perl6
  autocmd BufNewFile,BufRead *.asciidoc set filetype=asciidoc
  autocmd BufNewFile,BufRead *.rss set filetype=xml
  autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
  autocmd BufRead,BufNewFile *.jst set filetype=jst.html
  autocmd BufRead,BufNewFile *.rdoc set filetype=rdoc
  autocmd BufRead,BufNewFile *.ru set filetype=ruby
  autocmd BufRead,BufNewFile Gemfile set filetype=ruby
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
  autocmd BufRead,BufNewFile *.go set filetype=go
  autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4
endif

" Colors
Bundle "altercation/vim-colors-solarized"

filetype plugin indent on         " Turn on file type detection.
syntax enable                     " Turn on syntax highlighting.

set encoding=utf-8
set scrolloff=3                   " Minimum number of lines above and below the cursor

set showcmd                       " Display incomplete commands.
set showmode                      " Show the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion
set wildmode=list:longest         " Complete files like a shell.

let mapleader=","

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set relativenumber
set ruler                         " Show cursor position.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set autoindent
set smartindent

" Useful status information at bottom of screen
set laststatus=2                  " Show the status line all the time
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Word wrapping
set wrap                          " Turn on line wrapping.
set linebreak
set display+=lastline
set textwidth=0
set wrapmargin=0

" Make it easy to get into command mode
nnoremap ; :

" Make it easy to paste without autoindent
set pastetoggle=<F2>

" Movement keys
nnoremap j gj
nnoremap k gk

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Ctrl-S to save
map <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>i

" I like emacs
map <C-a> 0
imap <C-a> <Esc>0i
map <C-e> $
imap <C-e> <Esc>$a

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Save when losing focus
au FocusLost * :up

" Better key mappings for splits
nnoremap <leader>ws <C-w>s<C-w>j
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" GUI stuff
if (has("gui_running"))
  set guioptions-=T               " Hide toolbar.
  set guioptions-=rL              " Hide right scrollbar.
  set guioptions-=m               " Don't show menu.
  set guifont=Ubuntu\ Mono\ 12
  if has("gui_macvim")
    set guifont=Monaco:h14
  endif

  " Nice title
  if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                                              " file name
    set titlestring+=%h%m%r%w                                         " flags
    set titlestring+=\ -\ %{v:progname}                               " program name
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}  " working directory
  endif

  set background=light
  colorscheme solarized
endif
