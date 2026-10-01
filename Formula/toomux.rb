# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Control center for Claude Code sessions in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.0/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "f41205432bd38ab5d6d073b325d965f46b792ec66bb6e3a4132a23d9bba9c255"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.0/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "e60b5e7bfabc2a4487bea1afb4628cce3d866099852a8bcb3b452b3c7af84e73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.0/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ca914673b03a9db8c4673536871e8fe80f0b9ba07d5bb586fef18302098f5fe3"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.2.0/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ff10f00e703ae58bba97fe1ee302c276fa816025b4c8eda989142969440750c8"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
