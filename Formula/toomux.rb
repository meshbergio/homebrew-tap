# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Control center for Claude Code sessions in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.1/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "cbe4f90ee8b60b8739b33404174cd4ad4b62829a5d18d618167072e52a787913"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.1/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "7b474d11c70616884095266e32074af4ba50d653e675e742774ca2959505d713"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.1/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "84f715d60cdab94b7d5272bd4420abcca248f9f2ac6e0127a7f26dd3b6a78163"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.1/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "599e14bbd8dbaea50b1b3e692fac9bffa4c9e5978b35448ed9415501c148530f"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
