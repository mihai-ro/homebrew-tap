class Cmt < Formula
  desc "Zero-dependency conventional commits CLI — prompt, linter, git hook installer"
  homepage "https://github.com/mihai-ro/cmt"
  url "https://github.com/mihai-ro/cmt/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f4cb9b6dde586f23f67d869912c7a0b74fdf7f8790ddc60f94f52e10d53cfffe"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "cmt"
    (share/"cmt").install "schema/cmt.schema.json"
  end

  test do
    assert_match "cmt version #{version}", shell_output("#{bin}/cmt version")
    assert_match "feat", shell_output("#{bin}/cmt types")
    pipe_output("#{bin}/cmt lint", "feat: add login\n", 0)
    pipe_output("#{bin}/cmt lint", "bad message\n", 1)
  end
end
