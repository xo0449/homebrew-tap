class PomoyaCli < Formula
  desc "Pomoya in your terminal: focus timer synced with the Pomoya apps"
  homepage "https://pomoya.page"
  url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.3.3/pomoya-cli-0.3.3.tar.gz"
  sha256 "434da3fd5a224f933a07211934d348d451102a7a2f6f91d064b54787e20f99c5"

  bottle do
    root_url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.3.3"
    sha256 cellar: :any_skip_relocation, all: "97b45ab3c5764224b804c86861ff1c2ae5dead5396c2dee7096b8dfbf0cfebaa"
  end

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"pomoya").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "--max-semi-space-size=1" "#{libexec}/pomoya.mjs" "$@"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pomoya --version")
  end
end
