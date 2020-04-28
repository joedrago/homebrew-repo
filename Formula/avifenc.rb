class Avifenc < Formula
  desc "avifenc / avifdec"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/v0.7.2.tar.gz"
  sha256 "b9c1a33cc6a3bf579326241475bedc9f8076694c812243983d9b32962246eb75"
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
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.7.2/"
    cellar :any_skip_relocation
    sha256 "98f4f4dc125ee3c26713824c33162781d383a27225fb113280ba5554708e1e7b" => :catalina
  end

  test do
    system "false"
  end
end
