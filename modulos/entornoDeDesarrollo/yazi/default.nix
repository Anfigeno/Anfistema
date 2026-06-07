{
  config,
  usuario,
  lib,
  ...
}:
{
  options.anfistema.entornoDeDesarrollo.yazi.activar = lib.mkEnableOption "Activa el móduo de Yazi";

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.yazi.activar {
    home-manager.users.${usuario}.programs.yazi = {
      enable = true;
    };
  };
}
