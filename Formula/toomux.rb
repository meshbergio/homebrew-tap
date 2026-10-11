# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Claude Code sessions, accounts, handovers and memory in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.4.4"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.4/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "3e07f047d6fc043d1ef6f97f599c8259a59c57e99cdb72f9f67afbba61bd4117"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.4/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "69b14df178cd85551cdc6e2a5a5efc62e38355db9c28b59c5f2eadc33fc3a3f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.4/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "28eba75d9b44501f9430c9d1c2353a9b40b9a41b00dfe9adf2aeb6c0c1cd7cd8"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.4/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "03c72a8f1e186bdfc47826357720c7cea62c53b89518b7e78655d1e75bbc657a"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
