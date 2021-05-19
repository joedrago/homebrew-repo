class Avifenc < Formula
  desc "avifenc / avifdec"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/v0.9.1.tar.gz"
  sha256 "9d8fd1f0c1d5beb4611c04780a7f1632cfc8c1cd657c55c8990145a0af9f2dff"
  bottle do
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.9.1/"
    sha256 cellar: :any_skip_relocation, big_sur: "7458b1387b4ea163a87ef586cb161acebc72c2270fd2cb872fae8b6b6926b7b2"
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
