{
  config,
  usuario,
  lib,
  ...
}:
{
  options.anfistema.kdeconnect.activar = lib.mkEnableOption "Activa el módulo de KDE Connect";

  config = lib.mkIf config.anfistema.kdeconnect.activar {
    programs.kdeconnect.enable = true;
    home-manager.users.${usuario}.services.kdeconnect.enable = true;
  };
}
