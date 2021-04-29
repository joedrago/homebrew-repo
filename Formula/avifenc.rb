class Avifenc < Formula
  desc "avifenc / avifdec"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/v0.9.0.tar.gz"
  sha256 "ea1603fc18e7dd20cf01f0b405156576886ecb5df84db8c0e87187cd2f8a00f4"
  bottle do
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.9.0/"
    sha256 cellar: :any_skip_relocation, big_sur: "61f570bd202ee4c2a7f37c646336e997e74441bcf0b19af7569d52328a2c44d2"
  end

  depends_on "cmake" => :build
  depends_on "nasm" => :build
  depends_on "ninja" => :build

  def install
    Dir.chdir("ext")
    system "zsh", "aom.cmd"
    system "zsh", "libjpeg.cmd"
    system "zsh", "zlibpng.cmd"
    Dir.chdir("..")
    Dir.mkdir("build")
    Dir.chdir("build")
    system "cmake", "-G", "Ninja", "-DBUILD_SHARED_LIBS=0", "-DAVIF_CODEC_AOM=1", "-DAVIF_LOCAL_AOM=1",
"-DAVIF_LOCAL_ZLIBPNG=1", "-DAVIF_LOCAL_JPEG=1", "-DAVIF_BUILD_APPS=1", ".."
    system "ninja"
    bin.install "#{buildpath}/build/avifenc"
    bin.install "#{buildpath}/build/avifdec"
  end

  test do
    system "false"
  end
end
