{
  description = "Flake to setup GHC";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { flake-utils, nixpkgs, self }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in rec {
        devShell = pkgs.mkShell {
          buildInputs = [
            (pkgs.haskellPackages.ghcWithPackages (pkgs: [ pkgs.lens ]))
          ];
        };
      }
    );
}
