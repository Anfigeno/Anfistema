{
  config,
  lib,
  usuario,
  pkgs,
  ...
}:
{
  options.anfistema.entornoDeDesarrollo.direnv.activar = lib.mkEnableOption {
    description = "Activa el módulo de direnv";
  };

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.direnv.activar {
    home-manager.users.${usuario}.programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableFishIntegration = config.home-manager.users.${usuario}.programs.fish.enable;
    };
  };
}
