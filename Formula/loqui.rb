class Loqui < Formula
  desc "i18n translation engine for software projects, powered by LLMs"
  homepage "https://github.com/mihai-ro/loquiai"
  url "https://registry.npmjs.org/@mihairo/loqui/-/loqui-1.0.5.tgz"
  sha256 "9af25aa27cbefded1f13393482c214b1a0f15c3ae4c38fbd8981a019688eac4b"
  license "Apache-2.0"
  version "1.0.5"

  # node is required at runtime but we don't pull it in as a Homebrew dep.
  # users are expected to have node >=22 already installed (fnm, nvm, asdf, etc.)
  on_macos do
    depends_on :macos
  end

  def install
    system "npm", "install", "--prefix", libexec, "--production",
                             "--ignore-scripts", "--no-audit", "--no-fund",
                             "@mihairo/loqui@#{version}"

    (bin/"loqui").write <<~SHELL
      #!/bin/bash
      exec node "#{libexec}/lib/node_modules/@mihairo/loqui/dist/index.js" "$@"
    SHELL
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/loqui --version")
  end
end
