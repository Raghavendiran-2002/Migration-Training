#!/bin/bash

# Usage: ./migrate_repo.sh <github_repo_url> <gitlab_repo_url> <personal_access_token>

# Ensure the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <github_repo_url> <gitlab_repo_url> <personal_access_token>"
    exit 1
fi

GITHUB_REPO_URL=$1
GITLAB_REPO_URL=$2
ACCESS_TOKEN=$3
REPO_NAME=$(basename -s .git "$GITHUB_REPO_URL")

echo "Cloning the GitHub repository..."
git clone --mirror "$GITHUB_REPO_URL" "$REPO_NAME.git"

echo "Creating a new repository on GitLab..."
curl --request POST --header "PRIVATE-TOKEN: $ACCESS_TOKEN" \
     --data "name=$REPO_NAME" \
     "https://gitlab.com/api/v4/projects"

cd "$REPO_NAME.git" || exit
echo "Adding GitLab remote..."
git remote add gitlab "$GITLAB_REPO_URL"

echo "Pushing to GitLab..."
git push --mirror gitlab

echo "Verification..."
echo "Branches:"
git branch -r
echo "Tags:"
git tag

echo "Migration completed successfully."
