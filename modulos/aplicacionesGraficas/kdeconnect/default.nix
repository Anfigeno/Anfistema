{
  config,
  usuario,
  lib,
  ...
}:
{
  options.anfistema.aplicacionesGraficas.kdeconnect.activar =
    lib.mkEnableOption "Activa el módulo de KDE Connect";

  config = lib.mkIf config.anfistema.aplicacionesGraficas.kdeconnect.activar {
    programs.kdeconnect.enable = true;
    home-manager.users.${usuario}.services.kdeconnect.enable = true;
  };
}
