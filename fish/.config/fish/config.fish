# Utilities

eval (direnv hook fish)

if test -f ~/.config/fish/conda.fish
  source ~/.config/fish/conda.fish
end

if test -f ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end

# Bindings
bind \cs pet-select

# Fundle
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'tuvistavie/fish-ssh-agent'
fundle plugin 'tuvistavie/fish-fastdir'

fundle init
