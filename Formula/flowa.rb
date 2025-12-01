class Flowa < Formula
  desc "Pipeline-first language for modern flows"
  created_by "senapati484"
  homepage "https://github.com/senapati484/flowa"
  url "https://github.com/senapati484/flowa/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "1d3a6c73fb6bc6147427b8e00e73300b340cf49dcb0c86b12cdebfd9128af421"
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
