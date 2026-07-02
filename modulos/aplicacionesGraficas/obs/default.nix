{ config, lib, ... }:
{
  options.anfistema.aplicacionesGraficas.obs.activar = lib.mkEnableOption "Activa el módulo de OBS";

  config = lib.mkIf config.anfistema.aplicacionesGraficas.obs.activar {
    programs.obs-studio.enable = true;
  };
}
