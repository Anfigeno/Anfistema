{
  config,
  usuario,
  lib,
  ...
}:
{
  options.anfistema.awww.activar = lib.mkEnableOption {
    description = "Activa el módulo de awww";
  };

  config = lib.mkIf config.anfistema.awww.activar {
    home-manager.users.${usuario}.services.awww.enable = true;
  };
}
