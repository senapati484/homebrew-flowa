class Flowa < Formula
  desc "Pipeline-first language for modern flows"
  homepage "https://github.com/senapati484/flowa"
  url "https://github.com/senapati484/flowa/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "28bc2adf250d575dc56fa8fa397b002aa21536b6444ab0052d4c7c4a560416f3"
  version "0.1.1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"flowa"), "./cmd/flowa"
  end

  test do
    system "#{bin}/flowa", "--version"
  end
end
