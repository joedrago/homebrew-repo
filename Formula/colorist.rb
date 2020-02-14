class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.8.tar.gz"
  sha256 "379a438d9668281bd75ac863766583b3406220d40b39e0b590d8545a2e5aa7a9"
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
  #  root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.7/"
  #  cellar :any_skip_relocation
  #  sha256 "bb212ccb26bbee7b026d4d5b8d5aa5f2125f69087c03f992f7f507b205b020ce" => :catalina
  #end

  test do
    system "false"
  end
end
