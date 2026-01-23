class Imgcap < Formula
  desc "Extract and transfer photos from connected iOS devices"
  homepage "https://github.com/evertdespiegeleer/imgcap"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/evertdespiegeleer/imgcap/releases/download/v#{version}/imgcap-darwin-arm64"
      sha256 "d14066f0d30b8ead4ec61b8e4dcebb6d349350dc068203ec20203c8c647efee5"
    end

    on_intel do
      url "https://github.com/evertdespiegeleer/imgcap/releases/download/v#{version}/imgcap-darwin-x64"
      sha256 "548ae905816035390857e2b732d90c731490802724986aa17d499838e719c8e6"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "imgcap-darwin-arm64" => "imgcap"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "imgcap-darwin-x64" => "imgcap"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imgcap --version 2>&1", 1)
  end
end
