class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.14.tar.gz"
  sha256 "ef47248d8616b08c13d4f5af26f790df0721c74b5c99aae8e907aca9c6b4e4f8"
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
  #  root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.10/"
  #  cellar :any_skip_relocation
  #  sha256 "fbe0e94d6d5efaa4e5e06052f88a7fca10ecd34e886218f6b90cb76998639393" => :catalina
  #end

  test do
    system "false"
  end
end
