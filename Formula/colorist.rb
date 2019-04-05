class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.36.tar.gz"
  sha256 "c48903bbdfb1d1084c0cd57c711f3646241ea6274995943ceb99640e99142dc6"
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
