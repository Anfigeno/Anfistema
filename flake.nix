{
  description = "Sistema de Anfi";

  nixConfig = {
    extra-substituters = [ "https://playit-nixos-module.cachix.org" ];
    extra-trusted-public-keys = [
      "playit-nixos-module.cachix.org-1:22hBXWXBbd/7o1cOnh+p0hpFUVk9lPdRLX3p5YSfRz4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    niri-flake.url = "github:sodiboo/niri-flake";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovix = {
      url = "github:Anfigeno/Neovix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mestizo256nix = {
      url = "github:TemaMestizo/Mestizo256Nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";

    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        ./nix/variables.nix
        ./nix/pkgs.nix
        ./nix/configuracionesDeNixos.nix
        ./nix/shellDeDesarrollo.nix
      ];
    };
}
