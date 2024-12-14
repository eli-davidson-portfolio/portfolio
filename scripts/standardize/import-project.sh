#!/bin/bash

# Project import script
PROJECT_NAME=$1
ORIGINAL_REPO=$2

if [ -z "$PROJECT_NAME" ] || [ -z "$ORIGINAL_REPO" ]; then
    echo "Usage: ./import-project.sh <project-name> <original-repo-url>"
    exit 1
fi

echo "Importing $PROJECT_NAME from $ORIGINAL_REPO"
gh repo create eli-davidson-portfolio/$PROJECT_NAME --public
git clone $ORIGINAL_REPO temp/$PROJECT_NAME
cd temp/$PROJECT_NAME
git push --mirror git@github.com:eli-davidson-portfolio/$PROJECT_NAME.git

echo "Project imported. Please update INVENTORY.md with new project details."
