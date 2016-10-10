function pj
    ghq list | peco | read -l _pjdir
    cd (ghq root)/$_pjdir
end