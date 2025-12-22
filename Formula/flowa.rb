class Flowa < Formula
  desc "Flowa: A high-performance scripting language with JIT compilation"
  homepage "https://flowa-docs.vercel.app"
  url "https://raw.githubusercontent.com/senapati484/homebrew-flowa/main/flowa.tar.gz"
  version "0.1.7"
  sha256 "62a642660ec1c77736671533e967cce98d3b2945e5611b5f55f63274a1448414"
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
