#!/bin/bash

set -eu


cd .;

if [[ -n $(git status -s) ]]; then
    git fetch --depth=1;
    git checkout ${{ github.head_ref }};
    git add .;
    git -c user.name="GitHub Actions" -c user.email="actions@github.com" \
      commit -m "Auto commit from action" \
      --author="${{ github.actor }}";
    git push origin;
else
    echo "Working tree clean. Nothing to commit.";
fi
