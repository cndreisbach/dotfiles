### Fisherman
set fisher_home ~/vendor/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# Utilities

function -e fish_preexec _run_fasd
  fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
end

function z
  cd (fasd -d -e 'printf %s' "$argv")
end

eval (direnv hook fish)

source ~/.config/fish/conda.fish

if test -f ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
