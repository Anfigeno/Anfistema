{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.nautilus.activar = lib.mkEnableOption "Activa el módulo de nautilus";

  config = lib.mkIf config.anfistema.nautilus.activar {
    services.gvfs.enable = true;
    anfistema.paquetesHm = [ pkgs.nautilus ];
  };
}
