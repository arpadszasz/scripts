#!/bin/bash
# filename:    ~/bin/git-new-repo.sh
# author:      Árpád Szász <arpad.szasz@plenum.ro>
# modified:    2016-08-28
# description: Setup a minimal Git repository
# usage:       ~/bin/git-new-repo.sh <'Repo description'>

if [ -r .git ]
then
    echo 'Moving existing GIT repo to .git.bak'
    mv -i .git .git.bak
fi

git init

if [ "$1" ]
then
    echo "$1" > .git/description
fi

touch README.md TODO.md

cat <<'EOF' > .gitignore
tmp/*
!.gitignore
!.keep
EOF

mkdir tmp
touch tmp/.keep

git add -f README.md TODO.md .gitignore tmp/.keep

git commit -S -m 'Initial commit'

exit 0
