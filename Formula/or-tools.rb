# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OrTools < Formula
  desc "Google's Operations Research tools:"
  homepage "https://developers.google.com/optimization/"
  url "https://github.com/kucukaslan/or-tools/releases/download/v9.15-alpha15/ortools-arm64-macos-Make-849de053bdf664b2f77f3e936a318715fdd5c1fb.tar.gz"
  sha256 "26f65ed6db56fd6022cee4e1d63dcaf456b231d3b0f49d50c4cd7fc876811f11"
  license "Apache-2.0"

  version "9.15-alpha15"

  # This formula conflicts with the or-tools formula from homebrew-core
  conflicts_with "or-tools", because: "this is a custom build that replaces the core formula"

  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include "ortools/linear_solver/linear_solver.h"
      int main() {
        operations_research::MPSolver solver("test", operations_research::MPSolver::GLOP_LINEAR_PROGRAMMING);
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++17", "-I#{include}", "-L#{lib}", "-lortools", "-o", "test"
    system "./test"
  end
end
