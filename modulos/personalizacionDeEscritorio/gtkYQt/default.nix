{
  config,
  lib,
  usuario,
  pkgs,
  ...
}:
{
  options.anfistema.personalizacionDeEscritorio.gtkYQt.activar = lib.mkEnableOption {
    description = "Activa el módulo de GTK y Qt";
  };

  config = lib.mkIf config.anfistema.personalizacionDeEscritorio.gtkYQt.activar {
    home-manager.users.${usuario} = {

      dconf.enable = true;

      gtk =
        let
          tema = {
            name = "Gruvbox-Dark";
            package = pkgs.gruvbox-gtk-theme;
          };
        in
        {
          enable = true;

          font = {
            name = "Iosevka";
            package = pkgs.iosevka;
          };

          theme = tema;
          gtk4.theme = tema;

          iconTheme = {
            name = "Reversal";
            package = pkgs.reversal-icon-theme;
          };
        };

      qt = {
        enable = true;
        platformTheme.name = "gtk2";
        style.name = "gtk2";
      };

      home.pointerCursor = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
        gtk.enable = true;
      };
    };

    environment.sessionVariables = {
      QT_QPA_PLATFORMTHEME = "gtk2";
      QT_STYLE_OVERRIDE = "gtk2";
    };
  };
}
