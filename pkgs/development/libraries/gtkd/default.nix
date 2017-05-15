{ stdenv, fetchurl, fetchFromGitHub, dmd, pango, atk, gdk_pixbuf, gnome3, gstreamer, gtk3, glibc, pkgconfig }:

stdenv.mkDerivation rec {
  name = "gtkd";
  version = "3.6.3";
  buildInputs = [ dmd pango atk gdk_pixbuf gstreamer gtk3 gnome3.gtksourceview glibc pkgconfig ];

  src = fetchFromGitHub {
    owner = "gtkd-developers";
    repo = "GtkD";
    rev = "v${version}";
    sha256 = "17fhjd98d1gv31r9qlk86aaimmrp6pg2jspv4yg940igg9cbl54k";
  };

  makeFlags = "DC='dmd'";

  installFlags = "prefix=$(out)";

  meta = with stdenv.lib; {
    description = ''GtkD is a D binding and OO wrapper of GTK+'';
    license = licenses.lgpl3;
    platforms = platforms.linux;
  };
}
