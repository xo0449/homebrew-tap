class PomoyaCli < Formula
  desc "Pomoya in your terminal: focus timer synced with the Pomoya apps"
  homepage "https://pomoya.page"
  url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.2.0/pomoya-cli-0.2.0.tar.gz"
  sha256 "09c07c3b050db97f0b7950480f6c0026c6e1e18de925fc1e4a4de77ccd301d38"

  bottle do
    root_url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.2.0"
    sha256 cellar: :any_skip_relocation, all: "3e6ceb177d0be94e533d7ded1c368b691b26ab5c0fa1105044417bbe98c99522"
  end

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"pomoya").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/pomoya.mjs" "$@"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pomoya --version")
  end
end
