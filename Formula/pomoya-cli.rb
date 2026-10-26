class PomoyaCli < Formula
  desc "Pomoya in your terminal: focus timer synced with the Pomoya apps"
  homepage "https://pomoya.page"
  url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.3.2/pomoya-cli-0.3.2.tar.gz"
  sha256 "9c13eb738bd2a11586e93817d1d18b2a99e9c07118ebacde04b9d3caebc9c899"

  bottle do
    root_url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.3.2"
    sha256 cellar: :any_skip_relocation, all: "9a184d860f3a96ab0a06b1b35a80ddaad37204a89eef05d4900f251e879f9285"
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
