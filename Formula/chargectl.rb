# Homebrew formula for the tyldra-org/homebrew-tools tap, which people use
# with `brew install tyldra-org/tools/chargectl`. The release workflow
# fills in the version and checksum and attaches the result to each release
# as chargectl.rb; the homebrew workflow sends it to the tap on publishing.
class Chargectl < Formula
  desc "Battery charge control for Apple Silicon MacBooks"
  homepage "https://github.com/tyldra-org/chargectl"
  url "https://github.com/tyldra-org/chargectl/releases/download/v0.2.3/chargectl-aarch64-apple-darwin.tar.gz"
  sha256 "6f3392971556bada82b11c08d32b4eab9779e3eb5d74d74d48e4a3fbbe4ca6c5"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "chargectl"
  end

  # No `service` block: `chargectl install` starts chargectl's own root
  # service, so macOS lists one Login Items entry, not a second for Homebrew.
  def caveats
    <<~EOS
      chargectl controls charging through a service that runs as root.
      Start it once; it asks for your password:
        chargectl install
      `brew upgrade chargectl` updates the service by itself. To remove
      chargectl and its settings:
        chargectl uninstall
    EOS
  end

  test do
    assert_equal "chargectl #{version}", shell_output("#{bin}/chargectl --version").strip
  end
end
