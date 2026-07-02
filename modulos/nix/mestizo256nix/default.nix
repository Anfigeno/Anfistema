{
  config,
  lib,
  usuario,
  inputs,
  ...
}:
{
  options.anfistema.nix.mestizo256nix.activar =
    lib.mkEnableOption "Activa el módulo de Mestizo256Nix";

  config = lib.mkIf config.anfistema.nix.mestizo256nix.activar {
    home-manager.users.${usuario}.mestizo256nix = {
      activar = true;
      paleta = inputs.mestizo256nix.paletas.gruvbox;
    };
  };
}
