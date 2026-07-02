{ config, lib, ... }:
{
  options.anfistema.aplicacionesGraficas.droidcam.activar =
    lib.mkEnableOption "Activa el módulo de Droidcam";

  config = lib.mkIf config.anfistema.aplicacionesGraficas.droidcam.activar {
    programs.droidcam.enable = true;
  };
}
