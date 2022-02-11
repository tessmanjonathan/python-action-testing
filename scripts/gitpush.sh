#!/bin/bash

set -eu
echo $BRANCH_NAME
echo $ACTOR_NAME

cd .;

if [ -n $(git status -s) ]; then
    git fetch --depth=1;
    git checkout $BRANCH_NAME;
    git add .;
    git -c user.name="GitHub Actions" -c user.email="actions@github.com" \
      commit -m "Auto commit from action" \
      --author="$ACTOR_NAME";
    git push origin;
else
    echo "Working tree clean. Nothing to commit.";
fi
