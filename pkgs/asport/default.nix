{ lib
, stdenv
, fetchFromGitHub
, rustPlatform
, darwin
}:

rustPlatform.buildRustPackage rec {
  pname = "asport";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "AkinoKaede";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-Rp1/4QHbtjAE0j8ObW5MzGxh/CTINWYQ3shbuHKGVvg=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-FCzmkxTeDvgFNYw1RxtgOmLFZeFbKIGUOQABtLV29Mo=";
  
  meta = with lib; {
    description = "A quick and secure reverse proxy based on QUIC for NAT traversal.";
    homepage = "https://github.com/AkinoKaede/asport";
    licenses = licenses.gpl3Plus;
    # maintainers = with maintainers; [ akinokaede ];
  };
}