# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Claude Code sessions, accounts, handovers and memory in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.0/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "67730a76a788d4d87a5bb324b89308c8b5d64c7b86fe81175a1836ceb57f9769"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.0/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "3c423a54e3f450ddb3575177d579888c9149698a7bc101b3187470cdacbd0497"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.0/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "68d73d13b786d4fb9831c5b3435b1119171955836c30d699c640f65a6c6d555a"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.4.0/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e46260e0c9c51032b92260e8094088d684ca54877d9153045eaf8f65a3e5867f"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
