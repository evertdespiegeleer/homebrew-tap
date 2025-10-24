class RedCli < Formula
  desc "Red, a TUI Redis client"
  homepage "https://github.com/evertdespiegeleer/red-cli"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v0.0.1/red-darwin-arm64"
      sha256 "7526aba8cc2ba662b815902c7972dabbc9623d5b5cc02d2431efd53597e1830c"
    else
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v0.0.1/red-darwin-x64"
      sha256 "7526aba8cc2ba662b815902c7972dabbc9623d5b5cc02d2431efd53597e1830c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v0.0.1/red-linux-x64"
      sha256 "853e502352c52cf4acb5bc69510857ebd5951d1a3805740aaabfb6f796dfb10f"
    end
  end

  def install
    bin.install "red-darwin-arm64" => "red" if OS.mac? && Hardware::CPU.arm?
    bin.install "red-darwin-x64" => "red" if OS.mac? && Hardware::CPU.intel?
    bin.install "red-linux-x64" => "red" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
  end
end