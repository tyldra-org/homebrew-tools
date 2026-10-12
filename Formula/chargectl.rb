# Homebrew formula for the tyldra-org/homebrew-tools tap, which people use
# with `brew install tyldra-org/tools/chargectl`. The release workflow
# fills in the version and checksum and attaches the result to each release
# as chargectl.rb; the homebrew workflow sends it to the tap on publishing.
class Chargectl < Formula
  desc "Battery charge control for Apple Silicon MacBooks"
  homepage "https://github.com/tyldra-org/chargectl"
  url "https://github.com/tyldra-org/chargectl/releases/download/v0.2.0/chargectl-aarch64-apple-darwin.tar.gz"
  sha256 "5be52546fef5de1484f60f3c1e33b1cda4eff225bc5ffd04164ac9e45799c5c2"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "chargectl"
  end

  # Runs as the user: it installs chargectl's root service through the
  # macOS password dialog when needed, then stays running so Homebrew lists
  # it as started. No keep_alive, so a cancelled dialog does not come back.
  service do
    run [opt_bin/"chargectl", "service"]
    keep_alive false
    process_type :background
    log_path var/"log/chargectl.log"
    error_log_path var/"log/chargectl.log"
  end

  def caveats
    <<~EOS
      chargectl controls charging through a service that runs as root.
      Start it once; it asks for your password:
        brew services start chargectl
      Do not use sudo with brew services. `brew upgrade chargectl` updates
      the service by itself. To remove chargectl and its settings:
        chargectl uninstall
    EOS
  end

  test do
    assert_equal "chargectl #{version}", shell_output("#{bin}/chargectl --version").strip
  end
end
