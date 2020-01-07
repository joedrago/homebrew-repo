class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.7.tar.gz"
  sha256 "8fc376e5f4f2d7dd68a83a557a750e2cc95a4a804bd839397b200b363df7f2a0"
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

  #bottle do
  #  root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.6/"
  #  cellar :any_skip_relocation
  #  sha256 "1d51a237bb573877ea26a0a9fa479b120c1db69055a9cc28fdd53ba986afd977" => :catalina
  #end

  test do
    system "false"
  end
end
