# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Control center for Claude Code sessions in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.2.3"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.3/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "2f0dc1c89ce1c1d481ae419331616664271638199cb4c40c642bb3db430a8750"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.3/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "23ebc816aeac7d35e1c598ac563e8ff6329a393a6a3eb2492174ab4075bd47a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.3/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e4bc0db93aef30f989113e1a1381b38cf1bd18261f5a199adfb468ca37b11cf8"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.3/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf9a228ba4f8b1d64c00559b5d63115e6e29258902bd49dbbec17475d0685d2b"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
