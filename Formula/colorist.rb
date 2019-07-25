class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.47.tar.gz"
  sha256 "8c5c1bf21da53917505277f155d700b74805561c6fcf986db04fdb818134866b"
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
