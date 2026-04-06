class Cmt < Formula
  desc "Zero-dependency conventional commits CLI — prompt, linter, git hook installer"
  homepage "https://github.com/mihai-ro/cmt"
  url "https://github.com/mihai-ro/cmt/archive/refs/tags/@mihairo/cmt-v1.3.2.tar.gz"
  sha256 "85ee78f52a7fc16ea59ceea3c6fd0b0f6972da3d1d999f9d558b3228e4aec885"
  license "MIT"
  version "1.3.2"

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
