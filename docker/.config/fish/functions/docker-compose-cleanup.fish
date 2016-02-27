function docker-compose-cleanup --argument-names 'pattern'
    if test -n "$pattern"
        docker-compose ps | tail -n+3 | cut -d ' ' -f 1 | grep $pattern | xargs docker stop
    else
        docker-compose ps | tail -n+3 | cut -d ' ' -f 1 | xargs docker stop
    end
end
