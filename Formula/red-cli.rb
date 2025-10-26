class RedCli < Formula
  desc "Red, a TUI client for Redis"
  homepage "https://github.com/evertdespiegeleer/red-cli"
  version "0.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-arm64"
      sha256 "56ddcab6d9da03bbde50895dc463e0b9014b0effc156ccebd2a219adf83bf6cc"
    end

    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-x64"
      sha256 "56ddcab6d9da03bbde50895dc463e0b9014b0effc156ccebd2a219adf83bf6cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-x64"
      sha256 "b0a3363aafe820e80ccd701f398f08f86ee46f7a5cafe1e5b702eae80b421ee0"
    end

    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-arm64"
      sha256 "b0a3363aafe820e80ccd701f398f08f86ee46f7a5cafe1e5b702eae80b421ee0"
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
