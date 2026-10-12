# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Every Claude Code session on one screen in tmux, with handover and recovery"
  homepage "https://toomux.com"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.5.0/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "475b1395dec3c2bd0a743c3003ee15bb81b1c66c36da9bf44a2b972ac1caf85e"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.5.0/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "28426ab31a6c1d211c01a1d2cdede15d54e38758c242c46beb1c9e548c633b9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.5.0/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ce3c8343fbc9ce04e2ab190b76bdf233496fef7b2a8141bfbf1289aefea79783"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.5.0/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0ce99c56493d253fd03fd78d812dba3c005414e8dbc82d50a09890fbf60844c7"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
