class Cmt < Formula
  desc "Zero-dependency conventional commits CLI — prompt, linter, git hook installer"
  homepage "https://github.com/mihai-ro/cmt"
  url "https://github.com/mihai-ro/cmt/archive/refs/tags/@mihairo/cmt-v1.1.5.tar.gz"
  sha256 "a27fa9a42f3b06d4c361237a037beef4dd21b4cb56e4829309db3b44edf4a6ea"
  license "MIT"
  version "1.1.5"

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
