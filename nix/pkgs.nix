{ inputs, ... }:
let
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      inputs.niri-flake.overlays.niri
      inputs.firefox-addons.overlays.default
      inputs.nix-vscode-extensions.overlays.default
    ];
  };
  lib = pkgs.lib;
in
{
  _module.args = {
    inherit system pkgs lib;
    util = import ../util.nix { inherit pkgs lib; };
  };
}
