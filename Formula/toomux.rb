# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Claude Code sessions, accounts, handovers and memory in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.4.2"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.2/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "cc2e644b2b565523242560a605d6e5ef72b206032462770e565aba73ce566f0c"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.2/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "9f928b1c3961926e76859259f7d4564bc21653f9fe9e45850b7f424f10cae794"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.2/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "31255b4df11bd95187fb33eb794aed5c0211ecd29b53884930e394ecbddc7d14"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.2/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1750797ccc6c1b1d3f42b2a9a3c2f4ac6117c04d0c8d5ec4924c6f24209acc3a"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
