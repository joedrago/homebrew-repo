class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.0.17.tar.gz"
  sha256 "8c99b8ef91b9017df7b5bae33d4f6ff6da07f5a446ee9d19852b43139a738358"
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
