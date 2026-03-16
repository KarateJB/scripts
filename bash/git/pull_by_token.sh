#!/bin/bash
source ./export_gh_env.sh
MY_REPO=$1
cd $MY_REPO
git pull "https://${GH_APITOKEN}@github.com/${GH_USER}/$MY_REPO.git"
