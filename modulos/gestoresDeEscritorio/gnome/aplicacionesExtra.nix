{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.anfistema.gestoresDeEscritorio.gnome.activar {
    anfistema.paquetesHm = with pkgs; [
      file-roller
    ];
  };
}
