class RedCli < Formula
  desc "Red, a TUI client for Redis"
  homepage "https://github.com/evertdespiegeleer/red-cli"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-arm64"
      sha256 "6d087884e4881261a3c61eafa912021cf68a0ced8fa4fb95ac2fc1cb229c8b67"
    end

    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-x64"
      sha256 "6d087884e4881261a3c61eafa912021cf68a0ced8fa4fb95ac2fc1cb229c8b67"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-x64"
      sha256 "3d55b8beb0ec920d9aa1c0e365029304e90dc261d07cfe56d019c4320e5b440a"
    end

    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-arm64"
      sha256 "3d55b8beb0ec920d9aa1c0e365029304e90dc261d07cfe56d019c4320e5b440a"
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
