{
  description = "Flake to setup GHC";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { flake-utils, nixpkgs, self }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        config = {};
        overlays = [];
        pkgs = import nixpkgs { inherit config overlays system; };
      in rec {
        devShell = pkgs.haskellPackages.shellFor {
          packages = p: [
          ];

          buildInputs = with pkgs.haskellPackages; [
            cabal-install
            lens

            # Helpful tools for `nix develop` shells
            #
            #ghcid                   # https://github.com/ndmitchell/ghcid
            #haskell-language-server # https://github.com/haskell/haskell-language-server
            #hlint                   # https://github.com/ndmitchell/hlint
            #ormolu                  # https://github.com/tweag/ormolu
          ];

          withHoogle = true;
        };
      }
    );
}
