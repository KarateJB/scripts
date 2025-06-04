#!/bin/bash

# Enter date
echo 'Enter date (2025-01-01): '
read target_date


PS3='Before/After?'
IFS=' '
options=('before' 'after' 'equals')

select opt in ${options[@]}; do
        if [ $opt ]; then

            # Iterate over all branches
            # for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do 
            git for-each-ref --format='%(refname:short)' refs/heads/ | while IFS= read -r branch; do
              # Get the last commit date of the branch
              last_commit_date=$(git log -1 --format=%cd --date=short $branch)
              
              # Compare the last commit date with the target date
              case $opt in
                    before)
                            if [[ "$last_commit_date" < "$target_date" ]]; then
                              echo $branch : last commit on $last_commit_date
                            fi
                            ;;
                    after)
                            if [[ "$last_commit_date" > "$target_date" ]]; then
                              echo $branch : last commit on $last_commit_date
                            fi
                            ;;

                    equals)
                            if [[ "$last_commit_date" = "$target_date" ]]; then
                              echo $branch : last commit on $last_commit_date
                            fi
                            ;;
                    *)
                            echo "invalid option."
                            echo
                            break
                            ;;
              esac
            done

                
        else
                echo 'invalid option.'
        fi
done

