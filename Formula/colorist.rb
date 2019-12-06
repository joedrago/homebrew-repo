class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.6.tar.gz"
  sha256 "1299fc47961253d1e32f80b57e212a1650ff2c9f6580e8ad5f314b88ea88cf22"
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

    system "zsh", "./scripts/build.sh", "-DHOMEBREW_BUILD=1"
    bin.install "#{buildpath}/build/bin/colorist/colorist"
  end

#  bottle do
#    root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.6/"
#    cellar :any_skip_relocation
#    sha256 "e893ef16eb6fff9bcba008caf8f05f8ca00993f393e26b078d030a027a255f43" => :catalina
#  end

  test do
    system "false"
  end
end
