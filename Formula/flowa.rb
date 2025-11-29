class Flowa < Formula
  desc "Your fast, Python + Go inspired language"
  homepage "https://github.com/senapati484/flowa"
  url "https://github.com/senapati484/flowa/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "118e3ddf4bd18fc58cf76976bc5075013705b6a7bbc13a6c44f2e1c45b8c8cb5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/flowa"
  end

  test do
    system "#{bin}/flowa", "--version"
  end
end