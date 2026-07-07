class Paracli < Formula
  desc "Draft and submit Parabol daily standups from git activity"
  homepage "https://github.com/itisbryan/paracli"
  url "https://github.com/itisbryan/paracli/archive/refs/tags/v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "8fb9222a9ea19ee2f01fa17570eff3b9374aa76392f22e75e3877736671c615b"
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
