class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.56.tar.gz"
  sha256 "a4192ef3e5acf1e0b77ed47d3057382fd4e14f4ed62ae7e136260a35b92353a8"
  depends_on "cmake" => :build
  depends_on "nasm" => :build

  def install
    mkdir_p "build"
	cd "build"
    system "cmake", "-DHOMEBREW_BUILD=1", "-DCMAKE_BUILD_TYPE=Release", "..", *std_cmake_args
    system "make", "colorist-bin"
    bin.install "bin/colorist/colorist"
  end

  test do
    system "false"
  end
end
