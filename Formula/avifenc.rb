class Avifenc < Formula
  desc "avifenc / avifdec"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/v0.8.0.tar.gz"
  sha256 "c917f4a27add61b8ad15f328090942d519460b71219f31e60e5fe6aa8cf3dc4e"
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
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.8.0/"
    cellar :any_skip_relocation
    sha256 "e941deaca08d19c71fa1b5baf14a455035d488cca04b157da2e0c17149bacf03" => :catalina
  end

  test do
    system "false"
  end
end
