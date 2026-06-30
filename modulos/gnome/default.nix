{
  lib,
  config,
  pkgs,
  usuario,
  ...
}:
{
  options.anfistema.gnome.activar = lib.mkEnableOption "Activa el módulo de Entorno Gnome";

  config = lib.mkIf config.anfistema.gnome.activar {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      games.enable = false;
    };

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
    ];

    home-manager.users.${usuario} =
      let
        extensiones = with pkgs.gnomeExtensions; [
          appindicator
          gsconnect
          gtk4-desktop-icons-ng-ding
          user-themes
          no-titlebar-when-maximized
        ];

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
        programs.gnome-shell = {
          enable = true;
          extensions =
            extensiones
            |> map (extension: {
              id = extension.extensionUuid;
              package = extension;
            });
        };

        dconf = {
          enable = true;
          settings = {
            "org/gnome/shell".enabled-extensions = extensiones |> map (extension: extension.extensionUuid);
            "org/gnome/desktop/interface" = {
              color-scheme = "prefer-dark";
              accent-color = "red";
            };

            "org/gnome/mutter".dynamic-workspaces = true;
            "org/gnome/desktop/wm/preferences".num-workspaces = cantidadDeEscritorios;
            "org/gnome/desktop/wm/keybindings" = lib.mkMerge [
              atajosParaCambiarDeEscritorio
              atajosParaCambiarVentanaDeEscritorio
            ];
            "org/gnome/shell/keybindings" = atajosDesactivados;

            "org/gnome/shell/app-switcher".current-workspace-only = true;
            "org/gnome/shell/window-switcher".current-workspace-only = true;

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
  };
}
