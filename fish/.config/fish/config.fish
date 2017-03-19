# Utilities

eval (direnv hook fish)

set -x EDITOR vi

if test -f ~/.config/fish/conda.fish
  source ~/.config/fish/conda.fish
end

if test -f ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end

# Fundle
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'tuvistavie/fish-ssh-agent'

fundle init
