#!/bin/bash

# push.sh - 推送 slides 到 GitHub (使用 SSH key，免 token)

set -e

REPO_URL="git@github.com:fatfingererr/slides.git"
COMMIT_MSG="feat: add new slides"

echo "🚀 Pushing slides to GitHub..."

# Check if we're in the slides directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: Please run this script from the slides directory"
    exit 1
fi

# Add all changes
git add -A

# Check if there are changes to commit
if git diff --cached --quiet; then
    echo "ℹ️ No changes to commit"
    exit 0
fi

# Commit with fixed message
git commit -m "$COMMIT_MSG"

# Push to GitHub using SSH (no token needed if SSH key is configured)
git push origin HEAD:main

echo "✅ Slides pushed successfully!"
echo "🌐 Visit: https://fatfingererr.github.io/slides/"
