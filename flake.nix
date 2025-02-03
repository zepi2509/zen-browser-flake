{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs: {
    packages = builtins.listToAttrs (map (system:
      {
        name = system;
        value = with import nixpkgs { inherit system; config.allowUnfree = true;}; rec {

          zen-beta-appimage = pkgs.callPackage (import ./zen-browser) { };

          zen-twilight-appimage = pkgs.callPackage (import ./zen-browser/twilight.nix) { };

          default = zen-beta-appimage;
        };
      }
    )[ "x86_64-linux" ]);
  };
}
