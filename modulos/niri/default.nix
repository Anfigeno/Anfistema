{
  config,
  usuario,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.niri.activar = lib.mkEnableOption {
    description = "Activa el módulo de niri";
  };

  config = lib.mkIf config.anfistema.niri.activar {
    programs.niri.enable = true;

    home-manager.users.${usuario} = {
      programs.niri = {
        package = pkgs.niri-unstable;
        enable = true;
        settings = {
          xwayland-satellite = {
            enable = true;
            path = lib.getExe pkgs.xwayland-satellite-unstable;
          };
          input = {
            keyboard.xkb = { };
            touchpad = {
              tap = true;
              natural-scroll = true;
            };
            mouse = { };
          };
          # outputs."eDP-1" = {
          #   mode = {
          #     height = 1366;
          #     width = 768;
          #     refresh = 60.059;
          #   };
          #   scale = 1;
          # };
          layout = {
            gaps = 8;
            center-focused-column = "never";
            preset-column-widths = [
              { proportion = 1. / 3.; }
              { proportion = 1. / 2.; }
              { proportion = 2. / 3.; }
            ];
            default-column-width.proportion = 2. / 3.;
            focus-ring = {
              width = 2;
              active = {
                color = "#4b7da6";
              };
            };
          };
          animations = { };
          binds = {
            "Mod+O" = {
              repeat = false;
              action.toggle-overview = { };
            };
            "Mod+Q" = {
              repeat = false;
              action.close-window = { };
            };
            "Mod+H".action.focus-column-left = { };
            "Mod+L".action.focus-column-right = { };
            "Mod+Shift+H".action.move-column-left = { };
            "Mod+Shift+L".action.move-column-right = { };
            "Mod+D".action.focus-workspace-down = { };
            "Mod+U".action.focus-workspace-up = { };
            "Mod+Shift+D".action.move-column-to-workspace-down = { };
            "Mod+Shift+U".action.move-column-to-workspace-up = { };
            "Mod+Ctrl+D".action.move-workspace-down = { };
            "Mod+Ctrl+U".action.move-workspace-up = { };
            "Mod+Comma".action.consume-window-into-column = { };
            "Mod+Period".action.expel-window-from-column = { };
            "Mod+R".action.switch-preset-column-width = { };
            "Mod+Shift+R".action.switch-preset-column-width-back = { };
            "Mod+Ctrl+Shift+R".action.switch-preset-window-height = { };
            "Mod+Ctrl+R".action.reset-window-height = { };
            "Mod+F".action.maximize-column = { };
            "Mod+Shift+F".action.fullscreen-window = { };
            "Mod+Ctrl+F".action.expand-column-to-available-width = { };
            "Mod+C".action.center-column = { };
            "Mod+Ctrl+C".action.center-visible-columns = { };
            "Mod+V".action.toggle-window-floating = { };
            "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = { };
            "Mod+W".action.toggle-column-tabbed-display = { };
            "Print".action.screenshot = { };
            "Shift+Print".action.screenshot-screen = { };
            "Alt+Print".action.screenshot-window = { };
            "Mod+Shift+P".action.power-off-monitors = { };

            "Mod+Return".action.spawn = "${pkgs.kitty}/bin/kitty";
            "Mod+P".action.spawn = "${pkgs.fuzzel}/bin/fuzzel";

            "XF86AudioRaiseVolume".action.spawn = [
              "${pkgs.wireplumber}/bin/wpctl"
              "set-volume"
              "@DEFAULT_AUDIO_SINK@"
              "0.05+"
            ];
            "XF86AudioLowerVolume".action.spawn = [
              "${pkgs.wireplumber}/bin/wpctl"
              "set-volume"
              "@DEFAULT_AUDIO_SINK@"
              "0.05-"
            ];
            "XF86AudioMute".action.spawn = [
              "${pkgs.wireplumber}/bin/wpctl"
              "set-mute"
              "@DEFAULT_AUDIO_SOURCE@"
              "toggle"
            ];
            "XF86AudioPlay".action.spawn = [
              "${pkgs.playerctl}/bin/playerctl"
              "play-pause"
            ];
            "XF86AudioStop".action.spawn = [
              "${pkgs.playerctl}/bin/playerctl"
              "stop"
            ];
            "XF86AudioPrev".action.spawn = [
              "${pkgs.playerctl}/bin/playerctl"
              "previous"
            ];
            "XF86AudioNext".action.spawn = [
              "${pkgs.playerctl}/bin/playerctl"
              "next"
            ];
          }
          // (
            9
            |> lib.lists.genList (n: n + 1)
            |> lib.lists.map (
              numero:
              let
                n = lib.toString numero;
              in
              [
                {
                  name = "Mod+${n}";
                  value.action.focus-workspace = numero;
                }
                {
                  name = "Mod+Shift+${n}";
                  value.action.move-window-to-workspace = numero;
                }
              ]
            )
            |> lib.lists.flatten
            |> lib.listToAttrs
          );
        };
      };
    };
  };
}
