class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.38.tar.gz"
  sha256 "e7acbabff9f979f1f1f25d83b63f0c45a7b2650d5777297557b43cb002a892b2"
  depends_on "cmake" => :build
  depends_on "nasm" => :build

  def install
    mkdir_p "build"
	cd "build"
    system "cmake", "-DHOMEBREW_BUILD=1", "..", *std_cmake_args
    system "make", "colorist-bin"
    bin.install "bin/colorist/colorist"
  end

  test do
    system "false"
  end
end
