#!/bin/bash
set -e

# Define paths
FORMULA_PATH="./Formula/flowa.rb"
SOURCE_DIR="./editor-support"

echo "🚀 Starting Flowa installation with Editor Support..."

# 1. Install via Homebrew using the local Formula
echo "🍺 Updating Tap and Installing Flowa..."
TAP_DIR=$(brew --repository senapati484/homebrew-flowa)
if [ -z "$TAP_DIR" ]; then
    echo "Error: Tap senapati484/homebrew-flowa not found. Please run: brew tap senapati484/homebrew-flowa"
    exit 1
fi
cp "$FORMULA_PATH" "$TAP_DIR/Formula/flowa.rb"
brew reinstall flowa

# 2. Manual Editor Support Installation (Bypassing Sandbox)
echo "🛠️  Setting up Editor Support..."

# VS Code
VSCODE_EXT_DIR="$HOME/.vscode/extensions/flowa-language-support"
if [ -d "$HOME/.vscode" ] || [ -d "$HOME/Applications/Visual Studio Code.app" ] || [ -d "/Applications/Visual Studio Code.app" ]; then
    mkdir -p "$VSCODE_EXT_DIR"
    cp -r "$SOURCE_DIR/vscode/"* "$VSCODE_EXT_DIR"
    echo "  ✅ VS Code extension installed."
fi

# Vim/Neovim
VIM_DIR="$HOME/.vim"
if [ -d "$VIM_DIR" ]; then
    mkdir -p "$VIM_DIR/syntax" "$VIM_DIR/ftdetect"
    cp "$SOURCE_DIR/vim/flowa.vim" "$VIM_DIR/syntax/"
    cp "$SOURCE_DIR/vim/ftdetect/flowa.vim" "$VIM_DIR/ftdetect/"
    echo "  ✅ Vim syntax installed."
fi

# Sublime Text
SUBLIME_DIR="$HOME/Library/Application Support/Sublime Text/Packages/User"
if [ -d "$SUBLIME_DIR" ]; then
    cp "$SOURCE_DIR/sublime/Flowa.sublime-syntax" "$SUBLIME_DIR/"
    echo "  ✅ Sublime Text syntax installed."
fi

echo ""
echo "🎉 Installation Complete! Flowa and editor support are ready."
echo "Documentation: https://flowa-docs.vercel.app"
