class Avifenc < Formula
  desc "avifenc / avifdec"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/v0.9.3.tar.gz"
  sha256 "bcd9a1f57f982a9615eb7e2faf87236dc88eb1d0c886f3471c7440ead605060d"
  #bottle do
  #  root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.9.1/"
  #  sha256 cellar: :any_skip_relocation, big_sur: "c588e5e8b7b6fd6493bd5fe391da941226e99168f500cffc5af00ecb71b2c140"
  #end

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
