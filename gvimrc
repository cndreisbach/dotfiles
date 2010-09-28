" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set guioptions-=rL                " Don't show right scrollbar
set guioptions-=m                 " Don't show menu
set guifont=Consolas:h13

if has("gui_macvim")
  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
  map <D-x> :
endif

ruby << RUBY
def random_colorscheme
  if !defined?($color_schemes) || $color_schemes.empty?
    $color_schemes = File.read(File.expand_path("~/.vim/color_schemes.txt")).map { |cs| cs.chomp }
  end
  color_scheme = $color_schemes.shuffle.pop
  VIM.command "colorscheme #{color_scheme}"
end

random_colorscheme
RUBY

