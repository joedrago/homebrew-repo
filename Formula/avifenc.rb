class Avifenc < Formula
  desc "avifenc / avifdec"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/v0.8.4.tar.gz"
  sha256 "116b46a9a497c6ef178c5a20b912d8ac02f888dc8c537e40b5d16700823a9b16"
  bottle do
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.8.4/"
    sha256 cellar: :any_skip_relocation, catalina: "321f5bce8acd64c54ee29cbf7e30b4fd70707970bb6072681a5fc5ea23e12177"
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
