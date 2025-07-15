# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Todo < Formula
  desc "A simple command-line todo application"
  homepage "https://github.com/kucukaslan/todo"
  version "0.4.2"
  license "GPL-3.0-or-later"

  # This is a binary release, no compilation needed
  bottle :unneeded

  on_macos do
    on_intel do
      url "https://github.com/kucukaslan/todo/releases/download/v0.4.2/todo_0.4.2_Darwin_x86_64.tar.gz"
      sha256 "b21e4f9bf2999acdb988ae4e1c319968551cc7a88e249c224a6b479698c50502"
    end

    on_arm do
      url "https://github.com/kucukaslan/todo/releases/download/v0.4.2/todo_0.4.2_Darwin_arm64.tar.gz"
      sha256 "ffbeb61eab4ffa561747bee7e4ab5996410aa1cc6d2767139c1c9acaff1203ee"
    end
  end

  def install
    bin.install "todo"
  end

  test do
    assert_match "todo", shell_output("#{bin}/todo --help")
  end
end
