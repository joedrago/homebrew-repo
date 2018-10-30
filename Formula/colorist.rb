class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.23.tar.gz"
  sha256 "1aeb3509309636ef68bb871005553e3e7845190e5cab7fa77cd81d0a1f3d834c"
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
