{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.formateadores = {
    "biome".paquete = pkgs.biome;
    "nixfmt".paquete = pkgs.nixfmt;
  };
}
