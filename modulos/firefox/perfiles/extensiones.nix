{ pkgs, lib, ... }:
let
  paquetesDeExtensiones = with pkgs.firefox-addons; [
    stylus
    ublock-origin
    languagetool
    adaptive-tab-bar-colour
  ];
in
{
  configuracionParaPerfiles = {
    packages = paquetesDeExtensiones;
  };

  configuracionParaPolicies =
    paquetesDeExtensiones
    |> map (extension: {
      name = extension.addonId;
      value = {
        private_browsing = true;
        allowed_types = [ "all" ];
      };
    })
    |> lib.listToAttrs;
}
