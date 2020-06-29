class Avifenc < Formula
  desc "avifenc / avifdec"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/v0.7.3.tar.gz"
  sha256 "a4ce03649c58ec9f3dc6ab2b7cf7d58474b149acf1e4c563be4081bad60ed2dd"
  depends_on "cmake" => :build
  depends_on "nasm" => :build
  depends_on "ninja" => :build

  def install
    Dir.chdir('ext')
    system "zsh", "aom.cmd"
    system "zsh", "libjpeg.cmd"
    system "zsh", "zlibpng.cmd"
    Dir.chdir('..')
    Dir.mkdir('build')
    Dir.chdir('build')
    system "cmake", "-G", "Ninja", "-DBUILD_SHARED_LIBS=0", "-DAVIF_CODEC_AOM=1", "-DAVIF_LOCAL_AOM=1", "-DAVIF_LOCAL_ZLIBPNG=1", "-DAVIF_LOCAL_JPEG=1", "-DAVIF_BUILD_APPS=1", ".."
    system "ninja"
    bin.install "#{buildpath}/build/avifenc"
    bin.install "#{buildpath}/build/avifdec"
    bin.install "#{buildpath}/build/avifdump"
  end

  bottle do
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.7.3/"
    cellar :any_skip_relocation
    sha256 "f0000d9ebc6a9408c1aec6d30e8bf68dd28942e9929be3e6370c251041b3ac91" => :catalina
  end

  test do
    system "false"
  end
end
