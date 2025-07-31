{
  description = "Haskell development environment for 99 Haskell Problems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        haskellPackages = pkgs.haskell.packages.ghc9122.override {
          overrides = self: super: {
            brick = pkgs.haskell.lib.overrideCabal super.brick (oldAttrs: {
              version = "2.9";
              src = pkgs.fetchFromGitHub {
                owner = "jtdaugherty";
                repo = "brick";
                rev = "13fc9ede648de359366ed1d2b865fbd847fb2dc5";
                sha256 = "sha256-t+S7BkKYuq71rsiffOTuwgnmlWwGPlp5dxHZscsu9w8=";
              };
            });
          };
        };
        
        ghcWithPackages = haskellPackages.ghcWithPackages (ps: with ps; [
          QuickCheck
          hspec
          hspec-discover
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Haskell compiler with packages
            ghcWithPackages
            haskellPackages.cabal-install
            haskellPackages.haskell-language-server
            haskellPackages.hlint
            haskellPackages.ormolu
            haskellPackages.ghcid
            
            # Additional development tools
            pkg-config
            zlib
          ];

          shellHook = ''
            echo "🚀 Haskell development environment loaded!"
            echo "Available tools:"
            echo "  - ghc: $(ghc --version)"
            echo "  - cabal: $(cabal --version | head -n1)"
            echo "  - hls: Haskell Language Server available"
            echo "  - hlint: Haskell linter"
            echo "  - ormolu: Haskell formatter"
            echo "  - ghcid: GHC daemon for fast recompilation"
            echo ""
            echo "To run a Haskell file: ghc -e 'main' filename.hs"
            echo "To start GHCi: ghci"
          '';
        };
      });
}
