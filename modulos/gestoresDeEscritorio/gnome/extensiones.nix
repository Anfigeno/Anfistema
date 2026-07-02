{
  pkgs,
  config,
  lib,
  usuario,
  ...
}:
{
  config = lib.mkIf config.anfistema.gestoresDeEscritorio.gnome.activar {
    home-manager.users.${usuario} =
      let
        extensiones = with pkgs.gnomeExtensions; [
          appindicator
          gsconnect
          gtk4-desktop-icons-ng-ding
          user-themes
          no-titlebar-when-maximized
        ];

      in
      {
        programs.gnome-shell = {
          enable = true;
          extensions =
            extensiones
            |> map (extension: {
              id = extension.extensionUuid;
              package = extension;
            });
        };

        dconf.settings."org/gnome/shell".enabled-extensions =
          extensiones |> map (extension: extension.extensionUuid);
      };

  };
}
