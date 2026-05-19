class Paracli < Formula
  desc "Draft and submit your Parabol daily standup from git activity"
  homepage "https://github.com/itisbryan/paracli"
  license "MIT"
  head "https://github.com/itisbryan/paracli.git", branch: "main"

  # Stable release: create a tag, then set url + sha256 and remove nothing (head stays as a fallback).
  # url "https://github.com/itisbryan/paracli/archive/refs/tags/v0.1.0.tar.gz"
  # sha256 ""

  uses_from_macos "ruby"

  def install
    bin.install "bin/paracli"
  end

  test do
    assert_match "selftest: ok", shell_output("#{bin}/paracli --selftest")
    assert_match "paracli", shell_output("#{bin}/paracli version")
  end
end
