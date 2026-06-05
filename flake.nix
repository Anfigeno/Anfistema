{
  description = "Sistema de Anfi";

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
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      niri-flake,
      neovix,
      mestizo256nix,
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
      ];

      modulosHM = [
        niri-flake.homeModules.niri
        neovix.moduloHM
        mestizo256nix.moduloHM
      ];
    in
    {
      nixosConfigurations =
        maquinas
        |> lib.map (maquina: {
          name = maquina;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit
                inputs
                usuario
                maquina
                perfiles
                ;
            };
            modules = [
              { nixpkgs.pkgs = pkgs; }
              home-manager.nixosModules.home-manager
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
