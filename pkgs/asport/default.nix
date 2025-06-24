{ lib
, stdenv
, fetchFromGitHub
, rustPlatform
, darwin
}:

rustPlatform.buildRustPackage rec {
  pname = "asport";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "AkinoKaede";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-u9bVC7zzJ8cb8cflgFWM6ExBWnR/GiyBYOJVfLIljx0=";
  };

  cargoLock.lockFile = ./Cargo.lock;
  
  meta = with lib; {
    description = "A quick and secure reverse proxy based on QUIC for NAT traversal.";
    homepage = "https://github.com/AkinoKaede/asport";
    licenses = licenses.gpl3Plus;
    # maintainers = with maintainers; [ akinokaede ];
    broken = true; # LazyCell is not stable in Rust.
  };
}