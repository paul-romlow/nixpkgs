{ stdenv, fetchurl, static ? false }:

stdenv.mkDerivation rec {
  pname = "libev";
  version="4.33";

  src = fetchurl {
    url = "http://dist.schmorp.de/libev/Attic/${pname}-${version}.tar.gz";
    sha256 = "1sjs4324is7fp21an4aas2z4dwsvs6z4xwrmp72vwpq1s6wbfzjh";
  };

  configureFlags = stdenv.lib.optional (static) "LDFLAGS=-static";

  meta = {
    description = "A high-performance event loop/event model with lots of features";
    maintainers = [ stdenv.lib.maintainers.raskin ];
    platforms = stdenv.lib.platforms.all;
    license = stdenv.lib.licenses.bsd2; # or GPL2+
  };
}
