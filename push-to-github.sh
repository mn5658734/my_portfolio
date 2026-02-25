#!/bin/bash
# Run this script in your system Terminal (outside Cursor) to push to GitHub
# Cursor's git wrapper adds --trailer which isn't supported by older Git versions

cd "$(dirname "$0")"

# Remove Cursor's wrapper by using full path to git
GIT_CMD="/usr/bin/git"

$GIT_CMD add .
$GIT_CMD commit -m "Initial commit: Milan Nayak portfolio website"
$GIT_CMD branch -M main
$GIT_CMD remote add origin https://github.com/mn5658734/my_portfolio.git 2>/dev/null || $GIT_CMD remote set-url origin https://github.com/mn5658734/my_portfolio.git
$GIT_CMD push -u origin main

echo ""
echo "Done! Your portfolio is live at: https://mn5658734.github.io/my_portfolio/"
echo "(Enable GitHub Pages in repo Settings > Pages if you want it hosted)"
