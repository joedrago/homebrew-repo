class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.5.tar.gz"
  sha256 "5ecd9f810dc0375ca8c9b1508f77d0968a365e1f5bc0577d1fdec88340521fe7"
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
