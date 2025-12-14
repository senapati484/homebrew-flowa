# Flowa Distribution Guide

## Quick Install (macOS)

### Option 1: Automatic Install (Recommended)
Installs Flowa and automatically sets up VS Code/Vim extensions.

```bash
curl -fsSL https://raw.githubusercontent.com/senapati484/homebrew-flowa/main/install_with_editor_support.sh | bash
```

### Option 2: Standard Homebrew Install
Installs Flowa only (manual editor setup required).

```bash
brew tap senapati484/flowa
brew install flowa
```

### Option 3: Manual VS Code Extension
If you prefer, you can install the extension separately:
1. Download `flowa-0.1.0.vsix` from releases (or build it from `editor-support/vscode`).
2. Run `code --install-extension flowa-0.1.0.vsix`.

*Note: If you use Option 2, run the commands shown in the output to enable syntax highlighting.*

---

## Publishing to Homebrew

The formula installs a **pre-built binary** from the tarball hosted in the `homebrew-flowa` repository.

### Update Homebrew Tap

Whenever you update Flowa:

```bash
# 1. Copy the updated files to homebrew-flowa repo
cp packaging/Formula/flowa.rb /path/to/homebrew-flowa/Formula/
cp packaging/flowa.tar.gz /path/to/homebrew-flowa/

# 2. Commit and push
cd /path/to/homebrew-flowa
git add Formula/flowa.rb flowa.tar.gz
git commit -m "Update Flowa to v0.1.4"
git push origin main
```

Users can then update with:
```bash
brew update
brew upgrade flowa
```

---

## How It Works

- **Binary distribution**: The tarball contains a pre-compiled `flowa` binary
- **Hosted in homebrew-flowa**: The tarball is stored in your public tap repository
- **No compilation needed**: Users get instant installation without building from source
- **Works with private repos**: The main flowa-v8 repo can remain private

---

## Building the Tarball

To create a new `flowa.tar.gz`:

```bash
# Build the project
./build.sh

# Create the tarball
cd packaging
tar -czf flowa.tar.gz -C ../build flowa ../LICENSE ../README.md
```

Or use the existing `flowa.tar.gz` in the packaging directory.

---

## Windows Installer

Build the installer using NSIS:

```cmd
cd packaging
makensis windows-installer.nsi
```

Output: `flowa-installer-windows.exe`

---

## Files

- `Formula/flowa.rb` - Homebrew formula (copy to homebrew-flowa/Formula/)
- `flowa.tar.gz` - Pre-built binary archive (copy to homebrew-flowa root)
- `windows-installer.nsi` - Windows installer script

---

## Testing Locally

Before pushing to homebrew-flowa, test the formula:

```bash
# Test installation from local formula
brew install --build-from-source packaging/Formula/flowa.rb

# Verify it works  
flowa --version
flowa tests/test_empty.flowa

# Clean up
brew uninstall flowa
```


