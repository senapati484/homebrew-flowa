# Flowa Editor Support

This directory contains syntax highlighting and file icons for Flowa across multiple editors.

## Quick Install

Run the automatic installer:

```bash
cd editor-support
./install.sh
```

This will automatically detect your installed editors and set up syntax highlighting!

## Supported Editors

### ✅ Visual Studio Code
- Custom `.flowa` file icon
- JavaScript-based syntax highlighting
- Auto-installed to `~/.vscode/extensions/`

### ✅ Sublime Text  
- JavaScript-based syntax highlighting
- Auto-installed to Sublime packages directory

### ✅ Vim / Neovim
- Syntax highlighting
- Filetype detection
- Auto-installed to `~/.vim/` and `~/.config/nvim/`

## Manual Installation

### VS Code
```bash
cp -r vscode ~/.vscode/extensions/flowa-language-support
# Restart VS Code
```

### Sublime Text
```bash
# macOS
cp sublime/Flowa.sublime-syntax "$HOME/Library/Application Support/Sublime Text/Packages/User/"

# Linux
cp sublime/Flowa.sublime-syntax ~/.config/sublime-text/Packages/User/
```

### Vim/Neovim
```bash
# Vim
mkdir -p ~/.vim/syntax ~/.vim/ftdetect
cp vim/flowa.vim ~/.vim/syntax/
cp vim/ftdetect/flowa.vim ~/.vim/ftdetect/

# Neovim
mkdir -p ~/.config/nvim/syntax ~/.config/nvim/ftdetect
cp vim/flowa.vim ~/.config/nvim/syntax/
cp vim/ftdetect/flowa.vim ~/.config/nvim/ftdetect/
```

## File Structure

```
editor-support/
├── install.sh                    # Smart installer script
├── vscode/                       # VS Code extension
│   ├── package.json
│   ├── language-configuration.json
│   ├── syntaxes/
│   │   └── flowa.tmLanguage.json
│   ├── fileicons/
│   │   └── flowa-icon-theme.json
│   └── icons/
│       ├── flowa-icon.svg
│       └── flowa-icon.png
├── sublime/                      # Sublime Text
│   └── Flowa.sublime-syntax
└── vim/                          # Vim/Neovim
    ├── flowa.vim
    └── ftdetect/
        └── flowa.vim
```

## Features

- 🎨 **Syntax Highlighting**: JavaScript-like highlighting for Flowa
- 🖼️ **File Icons**: Custom Flowa icon in VS Code
- 🚀 **Keywords**: `let`, `const`, `if`, `while`, `for`, `function`, etc.
- 📦 **Built-in Modules**: `http`, `sqlite`, `json`, `auth`, `jwt`, etc.
- 💬 **Comments**: Line (`//`) and block (`/* */`) comments
- 🔤 **Strings**: Double quotes, single quotes, and template literals
- 🔢 **Numbers**: Decimal, hex, binary, and octal

## Integration with Homebrew

The installer script is automatically run when you install Flowa via Homebrew:

```bash
brew install flowa
# Editor support is automatically configured!
```

## Uninstall

To remove editor support:

```bash
# VS Code
rm -rf ~/.vscode/extensions/flowa-language-support

# Sublime Text
rm ~/Library/Application\ Support/Sublime\ Text/Packages/User/Flowa.sublime-syntax

# Vim
rm ~/.vim/syntax/flowa.vim ~/.vim/ftdetect/flowa.vim

# Neovim
rm ~/.config/nvim/syntax/flowa.vim ~/.config/nvim/ftdetect/flowa.vim
```
