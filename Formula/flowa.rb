class Flowa < Formula
  desc "Flowa JIT Compiler - A V8-style JIT for backend systems"
  homepage "https://github.com/senapati484/flowa"
  url "https://github.com/senapati484/flowa/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  version "0.1.3"

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
