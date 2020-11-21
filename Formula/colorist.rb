class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.21.tar.gz"
  sha256 "3b04e4ddb44d97e64879672733f7285f1e603e7da10ce2a85142fc1dbad61c7d"
  depends_on "cmake" => :build
  depends_on "nasm" => :build
  depends_on "rust" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    # Pre-install a local copy of cbindgen as rav1e.cmd won't find it in the PATH
    mkdir_p "#{buildpath}/cargoroot"
    system "cargo", "install", "cbindgen", "--root", "#{buildpath}/cargoroot"
    ENV.append_path "PATH", "#{buildpath}/cargoroot/bin"

    # Note: The branch here must match the branch used by the version of colorist above!
    system "git", "clone", "-b", "v0.8.3", "https://github.com/AOMediaCodec/libavif.git", "ext/libavif"

    system "zsh", "./scripts/build.sh", "-DHOMEBREW_BUILD=1"
    bin.install "#{buildpath}/build/bin/colorist/colorist"
  end

  bottle do
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.21/"
    cellar :any_skip_relocation
    sha256 "a684ae81c634aba97be00b3ed563a6ab7f27b1843850f5f9ad63657b23dd6e90" => :catalina
  end

  test do
    system "false"
  end
end
