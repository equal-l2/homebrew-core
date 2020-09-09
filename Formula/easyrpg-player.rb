class EasyrpgPlayer < Formula
  desc "RPG Maker 2000/2003 games interpreter"
  homepage "https://easyrpg.org/"
  url "https://easyrpg.org/downloads/player/0.6.2.2/easyrpg-player-0.6.2.2.tar.xz"
  sha256 "b96e197b9bb5cd174f9900637bec16b9fc0c5c6989f7f7a3739da0db41e09669"
  license "GPL-3.0-or-later"

  livecheck do
    url "https://github.com/EasyRPG/Player.git"
  end

  bottle do
    cellar :any
    sha256 "02c3ea8286c3a787332708c5a2ef99ea5e776a97976fa0da1d1b77eba2338515" => :catalina
    sha256 "15cae4c835c47d3296f6e3fe529ebf2375ab427c8530a08893cd57a25231ff31" => :mojave
    sha256 "19872a3454cb43305c63acc11493d62ca1bcf827118403717d1c9d7a2c217579" => :high_sierra
  end

  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "harfbuzz"
  depends_on "liblcf"
  depends_on "libpng"
  depends_on "libsndfile"
  depends_on "libvorbis"
  depends_on "libxmp"
  depends_on "mpg123"
  depends_on "pixman"
  depends_on "sdl2"
  depends_on "sdl2_mixer"
  depends_on "speexdsp"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match /EasyRPG Player #{version}$/, shell_output("#{bin}/easyrpg-player -v")
  end
end
