class RedCli < Formula
  desc "Red, a TUI client for Redis"
  homepage "https://github.com/evertdespiegeleer/red-cli"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-arm64"
      sha256 "165dc29d5055bf08f30d39e456c037090006766446e8a17145d1b99df4b4e27c"
    end

    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-x64"
      sha256 "165dc29d5055bf08f30d39e456c037090006766446e8a17145d1b99df4b4e27c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-x64"
      sha256 "65c89bf97e383e6d536039789fb3201a2ddb03fc41e42b55086e5ad8244a0ddf"
    end

    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-arm64"
      sha256 "65c89bf97e383e6d536039789fb3201a2ddb03fc41e42b55086e5ad8244a0ddf"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "red-darwin-arm64" => "red"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "red-darwin-x64" => "red"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "red-linux-x64" => "red"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
  end
end
