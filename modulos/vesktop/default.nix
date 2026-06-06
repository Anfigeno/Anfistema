{ config, usuario, lib, ... }:
{
  options.anfistema.vesktop.activar = lib.mkEnableOption "Activa el módulo de Vesktop";

  config = lib.mkIf config.anfistema.vesktop.activar {
    home-manager.users.${usuario}.programs.vesktop.enable = true;
  };
}
