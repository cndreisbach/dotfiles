" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set guioptions-=rL                 " Don't show right scrollbar
set guioptions-=m                 " Don't show menu
set guifont=Monaco:h12

ruby << RUBY
if !defined?($color_schemes) || $color_schemes.empty?
  $color_schemes = File.read(File.expand_path("~/.vim/color_schemes.txt")).map { |cs| cs.chomp }
end
color_scheme = $color_schemes.shuffle.pop
VIM.command "colorscheme #{color_scheme}"
RUBY

"colorscheme freya

if has("gui_macvim")
  " Command-Shift-F for Ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>
  
  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
endif
