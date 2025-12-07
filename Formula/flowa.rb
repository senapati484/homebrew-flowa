class Flowa < Formula
  desc "Flowa JIT Compiler - A V8-style JIT for backend systems"
  homepage "https://github.com/senapati484/flowa"
  url "https://github.com/senapati484/flowa/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "bbe0a424594ab96fee8f93da1742b6a7930deb290e17dd36971c824cad2e6575"
  license "MIT"
  version "0.1.4"

  depends_on "cmake" => :build
  depends_on "llvm" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"test.flowa").write 'print("Hello Homebrew")'
    assert_match "Hello Homebrew", shell_output("#{bin}/flowa test.flowa")
  end
end
