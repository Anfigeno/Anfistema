{
  config,
  lib,
  usuario,
  ...
}:
{
  config = lib.mkIf config.anfistema.gnome.activar {
    home-manager.users.${usuario} =
      let
        cantidadDeEscritorios = 9;

        atajosParaCambiarDeEscritorio =
          cantidadDeEscritorios
          |> lib.genList (
            i:
            let
              n = i + 1;
            in
            lib.nameValuePair "switch-to-workspace-${toString n}" [ "<Super>${toString n}" ]
          )
          |> lib.listToAttrs;

        atajosParaCambiarVentanaDeEscritorio =
          cantidadDeEscritorios
          |> lib.genList (
            i:
            let
              n = i + 1;
            in
            lib.nameValuePair "move-to-workspace-${toString n}" [ "<Super><Shift>${toString n}" ]
          )
          |> lib.listToAttrs;

        atajosDesactivados =
          cantidadDeEscritorios
          |> lib.genList (
            i:
            let
              n = i + 1;
            in
            lib.nameValuePair "switch-to-application-${toString n}" [ ]
          )
          |> lib.listToAttrs;
      in
      {
        dconf.settings = {
          "org/gnome/desktop/wm/preferences".num-workspaces = cantidadDeEscritorios;
          "org/gnome/desktop/wm/keybindings" = lib.mkMerge [
            atajosParaCambiarDeEscritorio
            atajosParaCambiarVentanaDeEscritorio
          ];
          "org/gnome/shell/keybindings" = atajosDesactivados;

          "org/gnome/mutter".dynamic-workspaces = true;

          "org/gnome/shell/app-switcher".current-workspace-only = true;
          "org/gnome/shell/window-switcher".current-workspace-only = true;
        };
      };
  };
}
