class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.9.tar.gz"
  sha256 "b55a4b00f87996d878b6e22f4fecfc0659aee59676a3c20a3d1d097b4fb76543"
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
#    root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.8/"
#    cellar :any_skip_relocation
#    sha256 "75dd442dd653c3bf84e75e3289d3a8156917e1ae9d39faaa0ce5560ef24dd477" => :catalina
#  end

  test do
    system "false"
  end
end
