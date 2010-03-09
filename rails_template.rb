# Delete unnecessary files
run "rm README"
run "rm doc/README_FOR_APP"
run "rm public/index.html"
run "rm public/robots.txt"
run "rm -f public/javascripts/*"

# Copy database.yml
run "cp config/database.yml config/database.example.yml"

# Get jQuery
run "curl -L http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js > public/javascripts/jquery.js"

# Set up git
git :init

# Set up .gitignore files
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run %{find . -type d -empty | grep -v "vendor" | grep -v ".git" | grep -v "tmp" | xargs -I xxx touch xxx/.gitignore}
file '.gitignore', <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
END
