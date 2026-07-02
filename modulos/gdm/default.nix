{ config, lib, ... }:
{
  options.anfistema.gdm.activar = lib.mkEnableOption "Activa el módulo de GDM";

  config = lib.mkIf config.anfistema.gdm.activar {
    services.displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
  };
}
