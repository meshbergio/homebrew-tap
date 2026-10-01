# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Control center for Claude Code sessions in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.2.2"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.2/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "97b050866858d77be8b6b443992bd2d5757798d6b40b43bfc00974fce10d3a04"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.2/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "7583073f431065541b7177903108cff9b23fc2764513a7cea0091a9e6729e888"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.2/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ce384cddc3cd9eca6a90ed6713dc01480f0ffae78b83f0059e7a5b37db7ef969"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.2/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "58b947e5490f630fd7021b0ab7527a98d8eed8d377a6119364eba1c8987516b4"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
