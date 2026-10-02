# Rendered into meshbergio/homebrew-tap by packaging/homebrew/render.sh when a
# release is made. Prebuilt binaries per platform, laio-style.
class Toomux < Formula
  desc "Control center for Claude Code sessions in tmux"
  homepage "https://github.com/meshbergio/toomux"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.3.0/toomux-aarch64-apple-darwin.tar.gz"
      sha256 "0706b29f1d8fa30be945a8f1640e9418e8ba1d796464c3e5b3a2220af59dcc8d"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.3.0/toomux-x86_64-apple-darwin.tar.gz"
      sha256 "373c20cbabd7a4197116fcfe2899168025111f64094e6e1c59ffbb98044bbfad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meshbergio/toomux/releases/download/v0.3.0/toomux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2bb879e5ebf114b60b77d280c8e19bf6b14fd5fb0bb72437abb91b35285323dc"
    else
      url "https://github.com/meshbergio/toomux/releases/download/v0.3.0/toomux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "54a9f7464392c4d473c8231baa57057ce5240be32417701b3b2f607b14441072"
    end
  end

  def install
    bin.install "toomux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toomux --version")
  end
end
