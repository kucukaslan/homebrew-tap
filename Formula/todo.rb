# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Todo < Formula
  desc "A simple command-line todo application"
  homepage "https://github.com/kucukaslan/todo"
  version "0.1.4-alpha-2"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/kucukaslan/todo/releases/download/v0.1.4-alpha-2/todo_0.1.4-alpha-2_Darwin_x86_64.tar.gz"
      sha256 "ade333eba4ebea4e426d237352cd2f955c79d5a4ec5c7dfb123b88285c39753c"
    end

    on_arm do
      url "https://github.com/kucukaslan/todo/releases/download/v0.1.4-alpha-2/todo_0.1.4-alpha-2_Darwin_arm64.tar.gz"
      sha256 "2046e265d0895dfd33b6c25a3894e94c83c87c30a51ef38b02d362ed071f8996"
    end
  end

  def install
    bin.install "todo"
  end

  test do
    assert_match "todo", shell_output("#{bin}/todo --help")
  end
end
