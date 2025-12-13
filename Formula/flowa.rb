class Flowa < Formula
  desc "Flowa: A high-performance scripting language"
  homepage "https://flowa-docs.vercel.app"
  url "https://raw.githubusercontent.com/senapati484/homebrew-flowa/main/flowa.tar.gz"
  version "0.1.5"
  license "MIT"

  # Runtime dependencies
  depends_on "llvm"
  depends_on "sqlite3"

  def install
    # Extract and install pre-built binary
    bin.install "flowa"
    
    # Install any additional files if present
    if File.directory?("lib")
      lib.install Dir["lib/*"]
    end
    
    if File.directory?("include")
      include.install Dir["include/*"]
    end
    
    if File.directory?("share")
      share.install Dir["share/*"]
    end
  end

  test do
    (testpath/"test.flowa").write 'print("Hello Homebrew")'
    assert_match "Hello Homebrew", shell_output("#{bin}/flowa test.flowa")
  end
end
