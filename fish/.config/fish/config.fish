# Utilities

function -e fish_preexec _run_fasd
  fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
end

eval (direnv hook fish)

if test -f ~/.config/fish/conda.fish
  source ~/.config/fish/conda.fish
end

if test -f ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end

