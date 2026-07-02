{
  config,
  usuario,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.aplicacionesDeTerminal.yazi.activar =
    lib.mkEnableOption "Activa el móduo de Yazi";

  config = lib.mkIf config.anfistema.aplicacionesDeTerminal.yazi.activar {
    home-manager.users.${usuario}.programs.yazi = {
      enable = true;
      extraPackages = with pkgs; [
        wl-clipboard
      ];
      plugins = with pkgs.yaziPlugins; {
        wl-clipboard = wl-clipboard;
      };
      keymap = {
        mgr.prepend_keymap = [
          {
            on = "y";
            run = [
              "plugin wl-clipboard"
              "yank"
            ];
          }
        ];
      };
    };
  };
}
