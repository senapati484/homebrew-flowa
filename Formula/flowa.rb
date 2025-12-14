class Flowa < Formula
  desc "Flowa: A high-performance scripting language with JIT compilation"
  homepage "https://flowa-docs.vercel.app"
  url "https://raw.githubusercontent.com/senapati484/homebrew-flowa/main/flowa.tar.gz"
  sha256 "ba4bab82bbc5c9f9b0ced825f49d3b00e9a60af66073da0591605ac16f7cd64e"
  version "0.1.5"
  license "MIT"

  depends_on "llvm"
  depends_on "sqlite3"

  def install
    # Install binary
    bin.install "flowa"
    
    # Install editor support files to a shared location
    if Dir.exist?("editor-support")
      (share/"flowa").install "editor-support"
    else
      print "Warning: editor-support directory not found in source"
    end
  end

  def post_install
    ohai "🚀 Setting up Flowa editor integration..."

    editor_support = share/"flowa/editor-support"
    return unless editor_support.exist?

    # 1. VS Code Support
    vscode_ext_dir = Dir.home + "/.vscode/extensions/flowa-language-support"
    if Dir.exist?(Dir.home + "/.vscode/extensions") || Dir.exist?(Dir.home + "/Applications/Visual Studio Code.app")
      mkdir_p vscode_ext_dir
      cp_r Dir[editor_support/"vscode/*"], vscode_ext_dir
      ohai "  ✅ VS Code extension installed"
    end

    # 2. Sublime Text Support
    sublime_dir = ""
    if OS.mac?
      sublime_dir = Dir.home + "/Library/Application Support/Sublime Text/Packages/User"
    elsif OS.linux?
      sublime_dir = Dir.home + "/.config/sublime-text/Packages/User"
    end
    
    if !sublime_dir.empty? && Dir.exist?(sublime_dir)
      cp editor_support/"sublime/Flowa.sublime-syntax", sublime_dir
      ohai "  ✅ Sublime Text syntax installed"
    end

    # 3. Vim/Neovim Support
    vim_dirs = [Dir.home + "/.vim", Dir.home + "/.config/nvim"]
    vim_dirs.each do |base_dir|
      next unless Dir.exist?(base_dir)
      
      mkdir_p "#{base_dir}/syntax"
      mkdir_p "#{base_dir}/ftdetect"
      
      cp editor_support/"vim/flowa.vim", "#{base_dir}/syntax/"
      cp editor_support/"vim/ftdetect/flowa.vim", "#{base_dir}/ftdetect/"
      ohai "  ✅ Vim/Neovim syntax installed in #{base_dir}"
    end
    
    ohai "🎉 Flowa editor support installed!"
  end

  def caveats
    <<~EOS
      Flowa has been installed!
      
      To see syntax highlighting:
      - VS Code: Restart VS Code
      - Vim/Neovim: Open a .flowa file
      - Sublime Text: Open a .flowa file
      
      Documentation: https://flowa-docs.vercel.app
    EOS
  end

  test do
    (testpath/"test.flowa").write 'print("Hello Homebrew")'
    assert_match "Hello Homebrew", shell_output("#{bin}/flowa test.flowa")
  end
end
