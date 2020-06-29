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

  #bottle do
  #  root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.7.2/"
  #  cellar :any_skip_relocation
  #  sha256 "98f4f4dc125ee3c26713824c33162781d383a27225fb113280ba5554708e1e7b" => :catalina
  #end

  test do
    system "false"
  end
end
