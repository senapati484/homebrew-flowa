class Flowa < Formula
  desc "Flowa: A high-performance scripting language with JIT compilation"
  homepage "https://flowa-docs.vercel.app"
  url "https://raw.githubusercontent.com/senapati484/homebrew-flowa/main/flowa.tar.gz"
<<<<<<< HEAD
  sha256 "8ea02d1f62fc8caeea475938332771a9f2383d4dc9118914d2d66a97ae46e6b0"
  version "0.1.6"
=======
  sha256 "b0df4ad230d6137ae6b7ebc599e4b6213bd415b460c3d209fac6e0cfdb7f02f1"
  version "0.1.7"
>>>>>>> edd34e6 (feat: Implement `for` loops and `try-catch-finally` error handling, enhance HTTP security, and update editor support to v0.1.6.)
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
