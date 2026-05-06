#!/bin/bash
# Sync UtilityApp Docs to GitHub
# Usage: ./sync_docs.sh <repo_url>
# Example: ./sync_docs.sh git@github.com:sslakd/utility-app-docs.git

set -e

DOCS_DIR="$HOME/Desktop/UtilityApp_Docs"
REPO_URL="$1"

if [ -z "$REPO_URL" ]; then
  echo "❌ Usage: $0 <repo_url>"
  echo "   Example: $0 git@github.com:sslakd/utility-app-docs.git"
  echo "   Example: $0 https://github.com/sslakd/utility-app-docs.git"
  exit 1
fi

if [ ! -d "$DOCS_DIR" ]; then
  echo "❌ Docs directory not found: $DOCS_DIR"
  exit 1
fi

echo "📦 Syncing UtilityApp Docs to GitHub..."
echo "📁 Source: $DOCS_DIR"
echo "🌐 Target: $REPO_URL"
echo ""

cd "$DOCS_DIR"

# Init git if not already
if [ ! -d ".git" ]; then
  git init
  echo "✅ Git initialized"
fi

# Set remote
if git remote | grep -q origin; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi
echo "✅ Remote set: $REPO_URL"

# Stage all files
git add .

# Commit with timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M")
git commit -m "📝 Docs sync: $TIMESTAMP" 2>/dev/null || echo "ℹ️  Nothing new to commit"

# Push
git push -u origin main 2>/dev/null || git push -u origin master 2>/dev/null || {
  echo ""
  echo "⚠️  Push failed. Trying to create branch..."
  git branch -M main
  git push -u origin main 2>/dev/null || {
    echo "❌ Push failed. Check:"
    echo "   1. Did you create the repo on GitHub first?"
    echo "   2. Is your SSH key added to GitHub?"
    echo "   3. Try: gh repo create utility-app-docs --public --source=. --remote=origin --push"
  }
}

echo ""
echo "✅ Done!"
