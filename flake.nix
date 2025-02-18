{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    appimage-file-latest= {
      url = "https://github.com/zen-browser/desktop/releases/latest/download/zen-x86_64.AppImage";
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
          latest = pkgs.callPackage (import ./zen-browser/appimage-default.nix) { src = inputs.appimage-file-latest; pname = "zen-browser"; version = "latest"; };
          twilight = pkgs.callPackage (import ./zen-browser/appimage-default.nix) { src = inputs.appimage-file-twilight; pname = "zen-browser"; version = "twilight"; };
          default = latest;
        };
      })[ "x86_64-linux" ]);
  };
}
