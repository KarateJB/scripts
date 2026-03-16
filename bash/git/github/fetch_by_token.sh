#!/bin/bash
MY_REPO=$1
cd $MY_REPO
git fetch "https://${GH_APITOKEN}@github.com/${GH_USER}/$MY_REPO.git" --prune
