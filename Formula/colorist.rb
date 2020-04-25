class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.15.tar.gz"
  sha256 "c5febe069eb2aa24e706214ab05f7e4387c7bb552cd7db3cc30a05fe6f33aaf5"
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
  #  root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.14/"
  #  cellar :any_skip_relocation
  #  sha256 "56d9b33de7827e4064479d8ee62bd271bbf507535b6af11d89373787b7486621" => :catalina
  #end

  test do
    system "false"
  end
end
