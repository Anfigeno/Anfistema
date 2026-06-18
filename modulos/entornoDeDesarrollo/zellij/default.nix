{
  config,
  lib,
  usuario,
  pkgs,
  ...
}:
{
  options.anfistema.entornoDeDesarrollo.zellij.activar =
    lib.mkEnableOption "Activa el módulo de zellij";

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.zellij.activar {
    home-manager.users.${usuario}.programs.zellij = {
      enable = true;
      settings = {
        show_startup_tips = false;
        default_shell = "${pkgs.fish}/bin/fish";
        default_layout = "compact";
        pane_frames = false;
        copy_on_select = true;
        session_name = "Zel";
        attach_to_session = true;
        support_kitty_keyboard_protocol = false;
      };
      extraConfig = import ./atajosDeTeclado.nix;
    };
  };
}
