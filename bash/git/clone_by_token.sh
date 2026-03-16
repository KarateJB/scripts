#!/bin/bash
source ./export_gh_env.sh
MY_REPO=$1
CLONE_PATH=$2
cd $MY_REPO
git clone "https://${GH_APITOKEN}@github.com/${GH_USER}/$MY_REPO.git" $CLONE_PATH
