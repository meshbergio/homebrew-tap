# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Control center for Claude Code sessions in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.1.0/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "a28f4985bd4d47a18ff82f62592215366fb416fba9b2c7117d5684740f08a116"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.1.0/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "806ff393b08b599682ea6a48e251b394f10629ea3b266a836e44ecf9409fdc56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.1.0/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c7279d4d02cf7f73444a8e2ab4a176e2e19111b958cbd67567ce116a807f4e0d"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.1.0/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9a2a6ae133feb7ebe5dcdb52210cd8b12d2fd809f0f6bc6f4fff59236fdfe0ef"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
