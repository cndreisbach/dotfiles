function pj
    ghq list | peco | read -l _pjdir; and cd (ghq root)/$_pjdir
end
