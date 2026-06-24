class Cmt < Formula
  desc "Zero-dependency conventional commits CLI — prompt, linter, git hook installer"
  homepage "https://github.com/mihai-ro/cmt"
  url "https://github.com/mihai-ro/cmt/archive/refs/tags/@mihairo/cmt-v2.0.0.tar.gz"
  sha256 "5c66b71295b1a9068ca797e4d5a2bc35dfa6f65e4ad89e1f85e8179e18f9e8eb"
  license "MIT"
  version "2.0.0"

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
