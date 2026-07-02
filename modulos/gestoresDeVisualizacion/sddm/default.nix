{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.gestoresDeVisualizacion.sddm.activar =
    lib.mkEnableOption "Activa el módulo de SDDM";

  config =
    let
      tema = pkgs.sddm-astronaut.override {
        embeddedTheme = "astronaut";
      };
    in
    lib.mkIf config.anfistema.gestoresDeVisualizacion.sddm.activar {
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
