class PomoyaCli < Formula
  desc "Pomoya in your terminal: focus timer synced with the Pomoya apps"
  homepage "https://pomoya.page"
  url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.1.0/pomoya-cli-0.1.0.tar.gz"
  sha256 "36c5231956e3d78e72c101dfef218fa931839679f3f2d433d09a2d35cf95572f"

  bottle do
    root_url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, all: "11b9eb1f570b67aa35d681a83515aa40ea4445aa4205930f1d4237734e3ed9a8"
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
