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
    bin.install "#{buildpath}/build/avifdump"
  end

  #bottle do
  #  root_url "https://github.com/joedrago/homebrew-repo/releases/download/avifenc-v0.7.3/"
  #  cellar :any_skip_relocation
  #  sha256 "f0000d9ebc6a9408c1aec6d30e8bf68dd28942e9929be3e6370c251041b3ac91" => :catalina
  #end

  test do
    system "false"
  end
end
