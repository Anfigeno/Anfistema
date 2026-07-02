{
  config,
  usuario,
  lib,
  ...
}:
{
  options.anfistema.personalizacionDeEscritorio.awww.activar = lib.mkEnableOption {
    description = "Activa el módulo de awww";
  };

  config = lib.mkIf config.anfistema.personalizacionDeEscritorio.awww.activar {
    home-manager.users.${usuario}.services.awww.enable = true;
  };
}
