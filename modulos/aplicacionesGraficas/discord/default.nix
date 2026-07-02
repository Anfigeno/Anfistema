{
  config,
  usuario,
  lib,
  ...
}:
{
  options.anfistema.aplicacionesGraficas.discord.activar =
    lib.mkEnableOption "Activa el módulo de Discord";

  config = lib.mkIf config.anfistema.aplicacionesGraficas.discord.activar {
    home-manager.users.${usuario}.programs.discord.enable = true;
  };
}
