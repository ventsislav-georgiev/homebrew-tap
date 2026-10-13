class Ccpool < Formula
  include Language::Python::Shebang

  desc "Run Claude Code across a pool of accounts, rotating on rate limits"
  homepage "https://github.com/ventsislav-georgiev/ccpool"
  url "https://github.com/ventsislav-georgiev/ccpool/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "3bb99daa1ed996d3f49bd3bfb0c6c05c6a370a5ee7b3f45c94c0c768f9f9e16b"
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
