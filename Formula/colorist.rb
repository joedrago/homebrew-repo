class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.4.tar.gz"
  sha256 "bedecd3fb503092a9325989e5e1f01f0e231c52845187be49ff2daf29d3e28f9"
  depends_on "cmake" => :build

  def install
    system "cmake", "-DHOMEBREW_BUILD=1", ".", *std_cmake_args
    system "make", "colorist-bin"
    bin.install "bin/colorist/colorist"
  end

  test do
    system "false"
  end
end
