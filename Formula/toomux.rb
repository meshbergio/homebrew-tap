# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Claude Code sessions, accounts, handovers and memory in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.4.1"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.1/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "ddc832ee3acfcb4ab09f44063c82923bee68482c1439d24a3ae49afacee0feb8"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.1/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "8c027fb3163592125a8b79ef3207c4c66a72dcd6b168dc06a6f851dd2c50ff34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.1/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "78cb6092e805754965f96d518a8896c0c38bb219ab08eeaa782c30a9cfc9fc2a"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.1/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9c3e9ffe642fd563c999131ab2e28455f8b471a87f2b0b3983beeba2c4c92804"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
