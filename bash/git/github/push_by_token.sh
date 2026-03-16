#!/bin/bash
source ./export_gh_env.sh
# source "$(dirname "${BASH_SOURCE[0]}")"/export_gh_env.sh
if [ -z "$1" ]; then
  MY_REPO=${PWD##*/}
  git push "https://${GH_APITOKEN}@github.com/${GH_USER}/$MY_REPO.git"
else
  CURRENT_PATH="$(pwd)"
  cd "$1"
  MY_REPO=${PWD##*/}
  git push "https://${GH_APITOKEN}@github.com/${GH_USER}/$MY_REPO.git"
  cd $CURRENT_PATH
fi
