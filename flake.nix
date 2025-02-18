{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    appimage-file-latest= {
      url = "https://github.com/zen-browser/desktop/releases/download/latest/zen-x86_64.AppImage";
      flake = false;
    };
    appimage-file-twilight = {
      url = "https://github.com/zen-browser/desktop/releases/download/twilight/zen-x86_64.AppImage";
      flake = false;
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    packages = builtins.listToAttrs (map (system: {
        name = system;
        value = with import nixpkgs { inherit system; config.allowUnfree = true;}; rec {
          twilight = pkgs.callPackage (import ./zen-browser/appimage-default.nix) { src = inputs.appimage-file-twilight; pname = "zen"; version = "twilight"; };
          latest = pkgs.callPackage (import ./zen-browser/appimage-default.nix) { src = inputs.appimage-file-beta; pname = "zen"; version = "beta"; };
          default = zen-beta-appimage;
        };
      })[ "x86_64-linux" ]);
  };
}
