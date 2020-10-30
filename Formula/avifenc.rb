class Avifenc < Formula
  desc "avifenc / avifdec"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/v0.8.2.tar.gz"
  sha256 "1b79ec439d446dfd659098d36401b4d2df77dd19d53d7d944ade7164b3ef28a2"
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
  end

  bottle do
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.8.2/"
    cellar :any_skip_relocation
    sha256 "941ab40ae8364108060f0ce557bdc82d8162eebd72a0ea1e1fed76d14f4094bf" => :catalina
  end

  test do
    system "false"
  end
end
