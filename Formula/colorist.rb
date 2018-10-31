class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.24.tar.gz"
  sha256 "6ceb69028826782cf1db684929f64475b5c6fe385937d9d643c622057f005050"
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
