class Devdoctor < Formula
  include Language::Python::Virtualenv

  desc "Real-time log diagnostics CLI for backend developers"
  homepage "https://github.com/tusharravindran/devdoctor"
  url "https://github.com/tusharravindran/devdoctor/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ed0a69cf2dc371e16f4c416a08b1636eee2f4ab5f8b5139c5f8e7c2413b316ec"
  license "MIT"

  # python@3.13 has pre-built bottles for all current macOS versions.
  # tomllib is stdlib on 3.11+ so no extra dependency needed.
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "devdoctor 1.0.0", shell_output("#{bin}/devdoctor --version")
    assert_match "run", shell_output("#{bin}/devdoctor --help")
    assert_match "watch", shell_output("#{bin}/devdoctor --help")
  end
end
