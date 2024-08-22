{ lib
, stdenv
, fetchFromGitHub
# , rustPlatform
, darwin
}:

# Remove these code after next stable channel release (24.11)
with import <nixpkgs>
{
  overlays = [
    (import (fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"))
  ];
};
let
  rustPlatform = makeRustPlatform {
    cargo = rust-bin.stable.latest.default;
    rustc = rust-bin.stable.latest.default;
  };
in

rustPlatform.buildRustPackage rec {
  pname = "asport";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "AkinoKaede";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-Rp1/4QHbtjAE0j8ObW5MzGxh/CTINWYQ3shbuHKGVvg=";
  };

  cargoHash = "sha256-FCzmkxTeDvgFNYw1RxtgOmLFZeFbKIGUOQABtLV29Mo=";

  buildInputs = lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
    Security
  ]);
  

  meta = with lib; {
    description = "A quick and secure reverse proxy based on QUIC for NAT traversal.";
    homepage = "https://github.com/AkinoKaede/asport";
    licenses = licenses.gpl3Plus;
    maintainers = with maintainers; [ akinokaede ];
  };
}