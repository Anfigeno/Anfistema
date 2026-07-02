{
  self,
  inputs,
  lib,
  pkgs,
  system,
  usuario,
  maquinas,
  perfiles,
  util,
  ...
}:
let
  modulosHM = [
    inputs.niri-flake.homeModules.niri
    inputs.neovix.moduloHM
    inputs.mestizo256nix.moduloHM
  ];
in
{
  flake.nixosConfigurations =
    maquinas
    |> lib.map (
      maquina:
      lib.nameValuePair maquina (
        inputs.nixpkgs.lib.nixosSystem {
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
            inputs.playit-nixos-module.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            inputs.agenix.nixosModules.default
            { home-manager.sharedModules = modulosHM; }
            ../modulos
            ../maquinas/configuracionPorDefecto.nix
          ];
        }
      )
    )
    |> lib.listToAttrs;
}
