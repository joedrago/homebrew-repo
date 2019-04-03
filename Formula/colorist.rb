class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.35.tar.gz"
  sha256 "8eadbff9074faae4eef1bf73d9c649ad4e0f4213f10f9c98adaa53ca396873cb"
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
