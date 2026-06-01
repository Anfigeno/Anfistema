{
  config,
  usuario,
  lib,
  pkgs,
  perfiles,
  ...
}:
{
  options.anfistema.firefox.activar = lib.mkEnableOption {
    description = "Activa el módulo de Firefox";
  };

  config = lib.mkIf config.anfistema.firefox.activar {
    home-manager.users.${usuario}.programs.firefox = {
      enable = true;
      package = (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { });
      languagePacks = [
        "es-MX"
        "es-ES"
      ];
      profiles = import ./perfiles { inherit lib pkgs perfiles; };
      policies.ExtensionSettings =
        (import ./perfiles/extensiones.nix { inherit pkgs lib; }).configuracionParaPolicies;
    };
  };
}
