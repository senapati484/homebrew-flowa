#!/bin/bash
# Flowa Editor Integration Installer
# Automatically detects and installs syntax highlighting for your installed editors

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Allow passing source directory as first argument (for Homebrew post-install)
SCRIPT_DIR="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
INSTALLED_COUNT=0

echo -e "${BLUE}🚀 Flowa Editor Integration Installer${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install VS Code extension
install_vscode() {
    echo -e "${BLUE}📝 Installing VS Code extension...${NC}"
    
    # VS Code extensions directory
    VSCODE_EXT_DIR="$HOME/.vscode/extensions/flowa-language-support"
    
    # Create extension directory
    mkdir -p "$VSCODE_EXT_DIR"
    
    # Copy extension files
    cp -r "$SCRIPT_DIR/vscode/"* "$VSCODE_EXT_DIR/"
    
    echo -e "${GREEN}✓ VS Code extension installed${NC}"
    echo -e "  Location: $VSCODE_EXT_DIR"
    echo -e "  ${YELLOW}Note: Restart VS Code to activate${NC}\n"
    
    INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
}

# Function to install Sublime Text syntax
install_sublime() {
    echo -e "${BLUE}📝 Installing Sublime Text syntax...${NC}"
    
    # Sublime Text packages directory (User)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        SUBLIME_DIR="$HOME/Library/Application Support/Sublime Text/Packages/User"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        SUBLIME_DIR="$HOME/.config/sublime-text/Packages/User"
    fi
    
    if [ -d "$SUBLIME_DIR" ]; then
        cp "$SCRIPT_DIR/sublime/Flowa.sublime-syntax" "$SUBLIME_DIR/"
        echo -e "${GREEN}✓ Sublime Text syntax installed${NC}"
        echo -e "  Location: $SUBLIME_DIR/Flowa.sublime-syntax\n"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    else
        echo -e "${YELLOW}⚠ Sublime Text directory not found, skipping${NC}\n"
    fi
}

# Function to install Vim/Neovim syntax
install_vim() {
    echo -e "${BLUE}📝 Installing Vim syntax...${NC}"
    
    # Vim directories
    VIM_SYNTAX_DIR="$HOME/.vim/syntax"
    VIM_FTDETECT_DIR="$HOME/.vim/ftdetect"
    
    # Create directories if they don't exist
    mkdir -p "$VIM_SYNTAX_DIR"
    mkdir -p "$VIM_FTDETECT_DIR"
    
    # Copy syntax files
    cp "$SCRIPT_DIR/vim/flowa.vim" "$VIM_SYNTAX_DIR/"
    cp "$SCRIPT_DIR/vim/ftdetect/flowa.vim" "$VIM_FTDETECT_DIR/"
    
    echo -e "${GREEN}✓ Vim syntax installed${NC}"
    echo -e "  Location: $VIM_SYNTAX_DIR/flowa.vim"
    
    # Also install for Neovim if it exists
    if command_exists nvim; then
        NVIM_SYNTAX_DIR="$HOME/.config/nvim/syntax"
        NVIM_FTDETECT_DIR="$HOME/.config/nvim/ftdetect"
        
        mkdir -p "$NVIM_SYNTAX_DIR"
        mkdir -p "$NVIM_FTDETECT_DIR"
        
        cp "$SCRIPT_DIR/vim/flowa.vim" "$NVIM_SYNTAX_DIR/"
        cp "$SCRIPT_DIR/vim/ftdetect/flowa.vim" "$NVIM_FTDETECT_DIR/"
        
        echo -e "${GREEN}✓ Neovim syntax installed${NC}"
        echo -e "  Location: $NVIM_SYNTAX_DIR/flowa.vim\n"
    else
        echo ""
    fi
    
    INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
}

# Detect and install for each editor
echo -e "Detecting installed editors...\n"

# Check for VS Code
if command_exists code || [ -d "/Applications/Visual Studio Code.app" ]; then
    echo -e "${GREEN}Found: Visual Studio Code${NC}"
    install_vscode
else
    echo -e "${YELLOW}Not found: Visual Studio Code${NC}\n"
fi

# Check for Sublime Text
if command_exists subl || [ -d "/Applications/Sublime Text.app" ]; then
    echo -e "${GREEN}Found: Sublime Text${NC}"
    install_sublime
else
    echo -e "${YELLOW}Not found: Sublime Text${NC}\n"
fi

# Check for Vim/Neovim
if command_exists vim || command_exists nvim; then
    echo -e "${GREEN}Found: Vim/Neovim${NC}"
    install_vim
else
    echo -e "${YELLOW}Not found: Vim/Neovim${NC}\n"
fi

# Summary
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
if [ $INSTALLED_COUNT -gt 0 ]; then
    echo -e "${GREEN}✅ Installation Complete!${NC}"
    echo -e "Installed syntax highlighting for $INSTALLED_COUNT editor(s)\n"
    
    echo -e "${BLUE}Next steps:${NC}"
    if command_exists code; then
        echo -e "  • Restart VS Code to see .flowa file icons and syntax highlighting"
    fi
    if command_exists subl; then
        echo -e "  • Open a .flowa file in Sublime Text to see syntax highlighting"
    fi
    if command_exists vim || command_exists nvim; then
        echo -e "  • Open a .flowa file in Vim/Neovim to see syntax highlighting"
    fi
else
    echo -e "${YELLOW}⚠ No supported editors found${NC}"
    echo -e "Install VS Code, Sublime Text, or Vim to get syntax highlighting\n"
fi

echo ""
