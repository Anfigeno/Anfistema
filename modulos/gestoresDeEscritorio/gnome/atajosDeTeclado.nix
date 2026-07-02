{
  config,
  lib,
  usuario,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.anfistema.gestoresDeEscritorio.gnome.activar {
    home-manager.users.${usuario} =
      let
        atajosDeAplicaciones = [
          {
            name = "Abrir terminal";
            command = "${pkgs.kitty}/bin/kitty";
            binding = "<Super>Return";
          }
          {
            name = "Arbrir explorador de archivos";
            command = "${pkgs.nautilus}/bin/nautilus";
            binding = "<Super>e";
          }
        ];
      in
      {
        dconf.settings = {
          "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings =
            atajosDeAplicaciones
            |> lib.lists.imap0 (
              i: _: "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${toString i}/"
            );
        }
        // (
          atajosDeAplicaciones
          |> lib.lists.imap0 (
            i: valor:
            lib.nameValuePair "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${toString i}" valor
          )
          |> lib.listToAttrs
        );
      };
  };
}
