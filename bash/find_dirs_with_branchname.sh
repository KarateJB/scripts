#!/bin/bash

# Function to check if a directory is a git repo and contains branch name
check_git_repo() {
    local current_dir="$(pwd)"
    local dir="$1"
    cd "$dir" || return

    # Get the list of branches that contain 'feature'
    branches=$(git branch --list $2 | tr -d ' *')

    if [ ! -z "$branches" ]; then
        # Output the directory path and the feature branches
        echo "> ${dir}"
        echo "$branches"
        echo
    fi

    cd "$current_dir"
}

# Function to recursively search for git repositories
search_directories() {
    for dir in $(find "$1" -maxdepth 2 -type d -name ".git" 2>/dev/null); do
        # Strip the .git part to get the actual repo directory
        repo_dir="$(realpath "$dir")"
        check_git_repo "$repo_dir" "$2"
    done
}

if [ $1 == '-h' ]; then
    echo "Search the dir in current depth that contains the branch name, e.g. *feature-xxx*"
else
    # Start the search from the current directory or the directory passed as an argument
    # start_dir="${1:-.}"
    start_dir=.
    branch_name=$1
    search_directories "$start_dir" "$branch_name"
fi
