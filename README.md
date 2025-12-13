# Flowa Distribution Guide

## Quick Install (macOS)

```bash
# First time
brew tap senapati484/flowa
brew install flowa

# Or in one command
brew install senapati484/flowa/flowa
```

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


