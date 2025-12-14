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

    # Create the editor support path
    editor_support = share/"flowa/editor-support"
    
    # Debugging: Print paths
    puts "  Debug: Editor support path: #{editor_support}"
    puts "  Debug: User home: #{Dir.home}"

    unless editor_support.exist?
      ohai "⚠️  Warning: Could not find editor support files at #{editor_support}"
      ohai "    Please check if 'brew install' copied them correctly."
      return
    end

    # 1. VS Code Support
    # Detect VS Code
    vscode_installed = File.exist?("#{Dir.home}/Applications/Visual Studio Code.app") ||
                       File.exist?("/Applications/Visual Studio Code.app") ||
                       Dir.exist?("#{Dir.home}/.vscode")
    
    if vscode_installed
      vscode_ext_dir = "#{Dir.home}/.vscode/extensions/flowa-language-support"
      mkdir_p vscode_ext_dir
      
      # Use string interpolation for glob to ensure it's a string
      files = Dir["#{editor_support}/vscode/*"]
      if files.empty?
        puts "  Warning: No VS Code files found in #{editor_support}/vscode/"
      else
        cp_r files, vscode_ext_dir
        ohai "  ✅ VS Code extension installed"
      end
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
      
    # 2. Sublime Text Support
    sublime_dir = ""
    if OS.mac?
      sublime_dir = "#{Dir.home}/Library/Application Support/Sublime Text/Packages/User"
    elsif OS.linux?
      sublime_dir = "#{Dir.home}/.config/sublime-text/Packages/User"
    end
    
    if !sublime_dir.empty? && Dir.exist?(sublime_dir)
      target_file = "#{sublime_dir}/Flowa.sublime-syntax"
      src_file = "#{editor_support}/sublime/Flowa.sublime-syntax"
      
      if File.exist?(src_file)
        cp src_file, target_file
        ohai "  ✅ Sublime Text syntax installed"
      else
        puts "  Warning: Sublime syntax file not found at #{src_file}"
      end
    end

    # 3. Vim/Neovim Support
    vim_dirs = ["#{Dir.home}/.vim", "#{Dir.home}/.config/nvim"]
    vim_dirs.each do |base_dir|
      next unless Dir.exist?(base_dir)
      
      mkdir_p "#{base_dir}/syntax"
      mkdir_p "#{base_dir}/ftdetect"
      
      vim_file = "#{editor_support}/vim/flowa.vim"
      ftdetect_file = "#{editor_support}/vim/ftdetect/flowa.vim"
      
      if File.exist?(vim_file)
        cp vim_file, "#{base_dir}/syntax/"
        cp ftdetect_file, "#{base_dir}/ftdetect/"
        ohai "  ✅ Vim/Neovim syntax installed in #{base_dir}"
      else
         puts "  Warning: Vim files not found at #{vim_file}"
      end
    end
    
    ohai "🎉 Flowa editor support installation complete!"
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
