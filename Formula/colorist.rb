class Colorist < Formula
  desc "Image Converter with heavy ICC lumi tag abuse"
  homepage "https://github.com/joedrago/colorist"
  url "https://github.com/joedrago/colorist/archive/v0.1.20.tar.gz"
  sha256 "4d04cb4bbe0b391192239485c0aeab9ea4641f615ea80ddf1769bfb2f650d8fc"
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

  bottle do
    root_url "https://github.com/joedrago/homebrew-repo/releases/download/colorist-v0.1.20/"
    cellar :any_skip_relocation
    sha256 "b8484c737b4304ff97eb9695bbbc997c3b09bfc1e7ae912d0091567b52eac5f6" => :catalina
  end

  test do
    system "false"
  end
end
