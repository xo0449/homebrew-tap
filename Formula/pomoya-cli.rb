class PomoyaCli < Formula
  desc "Pomoya in your terminal: focus timer synced with the Pomoya apps"
  homepage "https://pomoya.page"
  url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.3.1/pomoya-cli-0.3.1.tar.gz"
  sha256 "882c52718481af2cea1e3a06519d9bd8b6d3d19f5fc86eb43cedcfcc5bcb5683"

  bottle do
    root_url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.3.1"
    sha256 cellar: :any_skip_relocation, all: "0650a47bf76938dd8c19ef9f67a2dcb829cabf1f58c1218295fa1bfc570accc3"
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
