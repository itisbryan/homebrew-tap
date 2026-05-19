class OhMyLazysql < Formula
  desc "A keyboard-first TUI database client with relationship-aware browsing"
  homepage "https://github.com/itisbryan/oh-my-lazysql"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/itisbryan/oh-my-lazysql/releases/latest/download/oh-my-lazysql_Darwin_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/itisbryan/oh-my-lazysql/releases/latest/download/oh-my-lazysql_Darwin_x86_64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "oh-my-lazysql"
  end

  test do
    system "#{bin}/oh-my-lazysql", "--version"
  end
end