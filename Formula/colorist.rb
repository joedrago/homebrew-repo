class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.3.tar.gz"
  sha256 "0dd3ab07889a5050e289e566da189d99dc5d99db71b7044ee8eccd777bac1d47"
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

  test do
    system "false"
  end
end
