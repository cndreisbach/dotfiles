" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

call pathogen#helptags()
call pathogen#runtime_append_all_bundles() 

set nocompatible                  " Must come first because it changes other options.
set t_Co=256
set exrc

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set encoding=utf-8
set scrolloff=3                   " Minimum number of lines above and below the cursor
set cursorline                    

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

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
              
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let g:fugitive_git_executable="/usr/local/bin/git"
let g:slimv_lisp='/usr/local/bin/clisp'

map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Ctrl-S to save
map <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>i

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Key mapping for FuzzyFinder
map <leader>f :FufFile<cr>
map <leader>h :FufFileWithCurrentBufferDir<cr>
map <leader>b :FufBuffer<cr>

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

map <leader>c :TComment<cr>

if has("autocmd")
  " Use tabs instead of spaces with HTML, CSS, and Javascript.
  autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType eruby setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
 
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.md set filetype=mkd
  autocmd BufNewFile,BufRead *.mkd set filetype=mkd
  autocmd BufNewFile,BufRead *.p6 set filetype=perl6
  autocmd BufNewFile,BufRead *.asciidoc set filetype=asciidoc
  autocmd BufNewFile,BufRead *.rss set filetype=xml
endif

" For GUI vim
if (has("gui_running"))
  set encoding=utf-8                " Use UTF-8 everywhere.
  set guioptions-=T                 " Hide toolbar.
  set guioptions-=rL                " Don't show right scrollbar
  set guioptions-=m                 " Don't show menu
  set guifont=Monaco:h12
  colorscheme habilight

  ruby << RUBY
  def random_colorscheme
    if !defined?($color_schemes) || $color_schemes.empty?
      $color_schemes = File.read(File.expand_path("~/.vim/color_schemes.txt")).map { |cs| cs.chomp }
    end
    color_scheme = $color_schemes.shuffle.pop
    VIM.command "colorscheme #{color_scheme}"
  end
RUBY

  if has("gui_macvim")
    " Command-/ to toggle comments
    map <D-/> :TComment<CR>
    map <D-x> :
  endif

  " Nice title
  if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                                              " file name
    set titlestring+=%h%m%r%w                                         " flags
    set titlestring+=\ -\ %{v:progname}                               " program name
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}  " working directory
  endif
endif

