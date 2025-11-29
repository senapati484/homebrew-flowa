class Flowa < Formula
  desc "Your fast, Python + Go inspired language"
  homepage "https://github.com/senapati484/flowa"
  url "https://github.com/senapati484/flowa/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PUT_REAL_SHA256_HERE"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/flowa"
  end

  test do
    system "#{bin}/flowa", "--version"
  end
end
