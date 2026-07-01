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
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      niri-flake,
      neovix,
      mestizo256nix,
      playit-nixos-module,
      agenix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          niri-flake.overlays.niri
          inputs.firefox-addons.overlays.default
        ];
      };
      lib = pkgs.lib;

      usuario = "anfitrion";
      maquinas = [
        "l470"
        "h81m"
      ];
      perfiles = [
        "defecto"
        "productividad"
        "procrastinacion"
      ];

      modulosHM = [
        niri-flake.homeModules.niri
        neovix.moduloHM
        mestizo256nix.moduloHM
      ];

      util = import ./util.nix { inherit pkgs lib; };
    in
    {
      nixosConfigurations =
        maquinas
        |> lib.map (maquina: {
          name = maquina;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit
                system
                inputs
                usuario
                maquina
                perfiles
                util
                ;
            };
            modules = [
              { nixpkgs.pkgs = pkgs; }
              playit-nixos-module.nixosModules.default
              home-manager.nixosModules.home-manager
              agenix.nixosModules.default
              {
                home-manager.sharedModules = modulosHM;
              }
              ./modulos
              ./maquinas/configuracionPorDefecto.nix
            ];
          };
        })
        |> lib.listToAttrs;

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nil
          nixd
          nixfmt
        ];
      };
    };
}
