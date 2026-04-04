#!/bin/bash
# Use macOS Terminal.app (or iTerm), NOT Cursor's terminal, so git isn't wrapped.
# Apple Git 2.24.x errors on: unknown option `trailer` — that's Cursor adding --trailer to commits.

set -e
cd "$(dirname "$0")"
GIT="/usr/bin/git"

"$GIT" add -A
if ! "$GIT" diff --cached --quiet; then
  "$GIT" commit -m "Update portfolio"
else
  echo "No new changes to commit."
fi

"$GIT" branch -M main
"$GIT" remote add origin https://github.com/mn5658734/my_portfolio.git 2>/dev/null \
  || "$GIT" remote set-url origin https://github.com/mn5658734/my_portfolio.git

echo "Pushing to origin..."
"$GIT" push -u origin main
echo "Done: https://github.com/mn5658734/my_portfolio"
