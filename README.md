# Flowa Distribution Guide

## Quick Install (macOS)

```bash
brew install senapati484/flowa
```

---

## Publishing to Homebrew

### 1. Create GitHub Release

1. Tag and push:
   ```bash
   git tag v0.1.4
   git push origin v0.1.4
   ```

2. Go to https://github.com/senapati484/flowa-v8/releases
3. Create new release with tag `v0.1.4`
4. Upload `packaging/flowa.tar.gz`
5. Publish (can be public even if repo is private)

### 2. Update Homebrew Tap

Copy `Formula/flowa.rb` to your `homebrew-flowa` repo:

```bash
cp Formula/flowa.rb /path/to/homebrew-flowa/Formula/
cd /path/to/homebrew-flowa
git add Formula/flowa.rb
git commit -m "Release v0.1.4"
git push
```

Done!

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

- `Formula/flowa.rb` - Homebrew formula (copy to homebrew-flowa repo)
- `flowa.tar.gz` - Pre-built binary (upload to GitHub Releases)
- `windows-installer.nsi` - Windows installer script

---

## Updating Version

1. **Build**:
   ```bash
   ./build.sh
   cd packaging
   shasum -a 256 flowa.tar.gz  # Get new hash
   ```

2. **Update Formula**:
   - Change version number
   - Update SHA256 hash
   - Update URL with new version tag

3. **Release**:
   - Create GitHub release
   - Upload tarball
   - Push updated formula to homebrew-flowa

Users auto-update with:
```bash
brew update && brew upgrade flowa
```
