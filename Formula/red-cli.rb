class RedCli < Formula
  desc "TUI Redis client inspired by k9s"
  homepage "https://github.com/evertdespiegeleer/red-cli"
  version "0.0.1-pr1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v0.0.1-pr1/red-darwin-arm64"
      sha256 "ca2c3be18a4eedb3c34826e1fadbbc4fec50f130c9404db0d46835db6569bd00"
    else
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v0.0.1-pr1/red-darwin-x64"
      sha256 "ca2c3be18a4eedb3c34826e1fadbbc4fec50f130c9404db0d46835db6569bd00"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v0.0.1-pr1/red-linux-x64"
      sha256 "34a2b807e59856f196392aa81ea8a7a288c48aef17b73399b383593ce855d544"
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