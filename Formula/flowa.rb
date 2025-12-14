class Flowa < Formula
  desc "Flowa: A high-performance scripting language with JIT compilation"
  homepage "https://flowa-docs.vercel.app"
  url "file:///Users/sayansenapati/Desktop/Dev/Languages%F0%9F%9A%80/homebrew-flowa/flowa.tar.gz"
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

  def caveats
    <<~EOS
      Flowa has been installed!
      Documentation: https://flowa-docs.vercel.app
    EOS
  end

  test do
    (testpath/"test.flowa").write 'print("Hello Homebrew")'
    assert_match "Hello Homebrew", shell_output("#{bin}/flowa test.flowa")
  end
end
