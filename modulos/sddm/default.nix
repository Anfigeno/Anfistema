{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.sddm.activar = lib.mkEnableOption {
    description = "Activar entorno de desarrollo";
  };

  config =
    let
      tema = pkgs.sddm-astronaut.override {
        embeddedTheme = "astronaut";
      };
    in
    lib.mkIf config.anfistema.sddm.activar {
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        extraPackages = [
          tema
          pkgs.kdePackages.qtmultimedia
        ];
        theme = "sddm-astronaut-theme";
      };

      environment.systemPackages = [
        tema
        pkgs.kdePackages.qtmultimedia
      ];
    };
}
