class OrTools < Formula
  desc "Google's Operations Research tools (custom build)"
  homepage "https://developers.google.com/optimization/"
  url "https://github.com/kucukaslan/or-tools/releases/download/v9.15-alpha15/ortools-arm64-macos-Make-849de053bdf664b2f77f3e936a318715fdd5c1fb.tar.gz"
  sha256 "26f65ed6db56fd6022cee4e1d63dcaf456b231d3b0f49d50c4cd7fc876811f11"
  license "Apache-2.0"
  version "9.15-alpha15"

  # This formula conflicts with the or-tools formula from homebrew-core
  conflicts_with "or-tools", because: "this is a custom build that replaces the core formula"

  depends_on "protobuf"
  depends_on "abseil"

  def install
    # This appears to be a precompiled binary distribution
    # Copy all contents to the prefix
    prefix.install Dir["*"]
  end

  test do
    # Test that the or-tools library can be imported in Python
    system "python3", "-c", "import ortools; print('OR-Tools imported successfully')"
  end
end
