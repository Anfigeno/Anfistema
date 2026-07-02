{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.aplicacionesGraficas.nautilus.activar =
    lib.mkEnableOption "Activa el módulo de nautilus";

  config = lib.mkIf config.anfistema.aplicacionesGraficas.nautilus.activar {
    services.gvfs.enable = true;
    anfistema.paquetesHm = [ pkgs.nautilus ];
  };
}
