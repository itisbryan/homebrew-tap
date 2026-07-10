class Paracli < Formula
  desc "Draft and submit Parabol daily standups from git activity"
  homepage "https://github.com/itisbryan/paracli"
  url "https://github.com/itisbryan/paracli/archive/refs/tags/v0.1.2.tar.gz"
  version "0.1.2"
  sha256 "2f83a47b2b195c0be33e584e2065ad4e645acfc36ea1a372dc969c8516331f21"
  license "MIT"
  head "https://github.com/itisbryan/paracli.git", branch: "main"

  depends_on "ruby"

  def install
    libexec.install "bin/paracli"
    (bin/"paracli").write_env_script libexec/"paracli", PATH: "#{Formula["ruby"].opt_bin}:$PATH"
    pkgshare.install "com.itisbryan.paracli.plist"
  end

  def caveats
    <<~EOS
      Optional launchd agent:
        cp #{opt_pkgshare}/com.itisbryan.paracli.plist ~/Library/LaunchAgents/
        launchctl load ~/Library/LaunchAgents/com.itisbryan.paracli.plist

      Set PARABOL_TOKEN in your environment before running paracli.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/paracli version")
  end
end
