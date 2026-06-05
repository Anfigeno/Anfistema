{ config, lib, ... }:
{
  options.anfistema.droidcam.activar = lib.mkEnableOption "Activa el módulo de Droidcam";

  config = lib.mkIf config.anfistema.droidcam.activar {
    programs.droidcam.enable = true;
  };
}
