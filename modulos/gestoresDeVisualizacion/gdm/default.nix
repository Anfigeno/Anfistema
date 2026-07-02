{ config, lib, ... }:
{
  options.anfistema.gestoresDeVisualizacion.gdm.activar =
    lib.mkEnableOption "Activa el módulo de GDM";

  config = lib.mkIf config.anfistema.gestoresDeVisualizacion.gdm.activar {
    services.displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
  };
}
