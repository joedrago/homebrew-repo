class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.17.tar.gz"
  sha256 "0eb2f43b2d069ef7876a1e8f2cb429fc51de1aad7e8523c40eafaf569f855167"
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
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.17/"
    cellar :any_skip_relocation
    sha256 "cd417b55a5242043d752519710e58014bfd7fbb9ffb39bf58df7c1f1b1e40a6e" => :catalina
  end

  test do
    system "false"
  end
end
