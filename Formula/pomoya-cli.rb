class PomoyaCli < Formula
  desc "Pomoya in your terminal: focus timer synced with the Pomoya apps"
  homepage "https://pomoya.page"
  url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.3.0/pomoya-cli-0.3.0.tar.gz"
  sha256 "527a3e771c49ea87d9caf72d7fba47601531bb2948258834c5f46eec6567154b"

  bottle do
    root_url "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-0.3.0"
    sha256 cellar: :any_skip_relocation, all: "28d5a8a72044636a2244f583a8762012c38f9dfa8ef91f51e173e07f6208f0a3"
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
