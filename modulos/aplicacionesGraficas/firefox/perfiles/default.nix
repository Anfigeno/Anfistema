{
  lib,
  pkgs,
  perfiles,
  ...
}:
perfiles
|> lib.imap0 (
  i: nombre: {
    name = nombre;
    value = {
      id = i;
      name = nombre;
      isDefault = if i == 0 then true else false;

      extensions = (import ./extensiones.nix { inherit pkgs lib; }).configuracionParaPerfiles;
      settings = import ./configuracion.nix;
      search = import ./busqueda { inherit lib; };
      userChrome = builtins.readFile ./userChrome.css;
    };
  }
)
|> lib.listToAttrs
