#!/bin/bash
#title           :rename-git-author.sh
#description     :This scripts renames the author and email in all commits
#                :in a git repository. Just place the correct values under
#                :OLD_EMAIL, CORRECT_NAME, CORRECT_EMAIL. 
#                :Your gitlab history will be then updated with the new names.
#                :This script was taken from https://stackoverflow.com/questions/3042437/how-can-i-change-the-commit-author-for-a-single-commit
#author          :ncortim
#date            :03_09_2024
#version         :0.1
#usage           :bash rename-git-author.sh
#                :./rename-git-author.sh
#dependecies     :
#==============================================================================

#exit on error
set -e
 
git filter-branch --env-filter '
 
OLD_EMAIL=""
CORRECT_NAME=""
CORRECT_EMAIL=""

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
