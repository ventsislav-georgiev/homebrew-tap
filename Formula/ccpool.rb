class Ccpool < Formula
  include Language::Python::Shebang

  desc "Run Claude Code across a pool of accounts, rotating on rate limits"
  homepage "https://github.com/ventsislav-georgiev/ccpool"
  url "https://github.com/ventsislav-georgiev/ccpool/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0f29163ff46bf2bc85fc1a831b317b9b64a6691ec471252e6c6258ed396fadc4"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "ccpool.py", "ccpool_proxy.py", "ccpool_watch.py"
    rewrite_shebang detected_python_shebang, libexec/"ccpool.py"
    bin.install_symlink libexec/"ccpool.py" => "ccpool"
  end

  test do
    assert_match "rotating on rate limits", shell_output("#{bin}/ccpool --help")
  end
end
