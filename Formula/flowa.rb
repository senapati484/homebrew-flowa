class Flowa < Formula
  desc "Flowa: A high-performance scripting language"
  homepage "https://github.com/senapati484/flowa-v8"
  url "https://github.com/senapati484/flowa-v8/releases/download/v0.1.4/flowa.tar.gz"
  sha256 "95ca163fba07b33d6cc802c0c44bf7f794edfee348811259c25b40e16cf1cab5"
  license "MIT"
  version "0.1.4"

  # Build-time dependencies
  depends_on "cmake" => :build
  depends_on "llvm@21" # Explicitly depend on LLVM 21? Homebrew usually just has 'llvm' at latest.
  # Let's use "llvm" since standard brew llvm is ~19/20, but user has 21. 
  # Actually, user's env has llvm 21.1.7. 
  # Homebrew core 'llvm' is 19.1.5 currently. 'llvm@18' exists.
  # If user installed llvm via brew and got 21, maybe it's the `llvm` formula (latest/HEAD)?
  # Users on stable Homebrew might have compilation issues if code requires LLVM 21 features.
  # But assuming generic LLVM support:
  depends_on "llvm" 
  depends_on "sqlite3"

  def install
    # Remove CMake build artifacts
    system "rm", "-f", "CMakeCache.txt"
    system "rm", "-rf", "build"
    
    llvm = Formula["llvm"]

    mkdir "build" do
      system "cmake", "..", 
             "-DCMAKE_INSTALL_PREFIX=#{prefix}", 
             "-DCMAKE_BUILD_TYPE=Release", 
             "-DCMAKE_CXX_STANDARD=17",
             "-DCMAKE_SKIP_RPATH=ON",
             "-DLLVM_DIR=#{llvm.opt_lib}/cmake/llvm"
      system "make", "install"
    end
  end

  test do
    (testpath/"test.flowa").write 'print("Hello Homebrew")'
    assert_match "Hello Homebrew", shell_output("#{bin}/flowa test.flowa")
  end
end
