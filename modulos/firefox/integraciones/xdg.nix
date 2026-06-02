{
  config,
  usuario,
  perfiles,
  lib,
  ...
}:
{
  config = lib.mkIf config.anfistema.firefox.activar {
    home-manager.users.${usuario} =
      { config, ... }:
      {
        xdg.desktopEntries =
          config.programs.firefox.profiles
          |> lib.mapAttrsToList (
            clave: _: {
              name = "firefox-${clave}";
              value = {
                name = "Firefox ${clave}";
                genericName = "Navegador Web";
                exec = "firefox -p ${clave}";
                icon = "firefox";
                terminal = false;
                categories = [
                  "Network"
                  "WebBrowser"
                ];
                mimeType = [
                  "text/html"
                  "text/xml"
                ];
              };
            }
          )
          |> builtins.listToAttrs;
      };
  };
}
