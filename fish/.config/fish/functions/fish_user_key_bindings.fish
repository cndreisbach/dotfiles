function fish_user_key_bindings
       bind \cr 'history | peco | read -l __hist; and eval $__hist'
end