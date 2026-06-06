{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Mini Statusline" = {
    paquete = pkgs.vimPlugins.mini-statusline;
    dependencias = with pkgs.vimPlugins; [
      mini-icons
      mini-diff
      mini-git
    ];
    configuracion = /* lua */ ''
      require("mini.statusline").setup(
        require("mestizo256.integraciones_especiales.mini-statusline").obtener()
      )
    '';
    lazy.eventos = [ "VimEnter" ];
  };
}
