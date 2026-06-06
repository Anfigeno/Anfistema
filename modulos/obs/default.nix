{ config, lib, ... }:
{
  options.anfistema.obs.activar = lib.mkEnableOption "Activa el módulo de OBS";

  config = lib.mkIf config.anfistema.obs.activar {
    programs.obs-studio.enable = true;
  };
}
