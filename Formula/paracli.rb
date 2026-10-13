class Paracli < Formula
  desc "Draft and submit Parabol daily standups from git activity"
  homepage "https://github.com/itisbryan/paracli"
  url "https://github.com/itisbryan/paracli/archive/refs/tags/v0.1.3.tar.gz"
  version "0.1.3"
  sha256 "20a8254cdc1ebb31360b500570e193ee1c55f68222536ffa8b7a049de1a75250"
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
