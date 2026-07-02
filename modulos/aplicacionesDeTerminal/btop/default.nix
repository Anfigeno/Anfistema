{
  config,
  lib,
  usuario,
  ...
}:
{
  options.anfistema.aplicacionesDeTerminal.btop.activar = lib.mkEnableOption {
    description = "Activa el módulo de btop";
  };

  config = lib.mkIf config.anfistema.aplicacionesDeTerminal.btop.activar {
    home-manager.users.${usuario}.programs.btop = {
      enable = true;
      settings = {
        color_theme = "tty";
        theme_background = false;
      };
    };
  };
}
