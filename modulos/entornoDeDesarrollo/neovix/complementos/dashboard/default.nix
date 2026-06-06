{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Dashboard" = {
    paquete = pkgs.vimPlugins.dashboard-nvim;
    configuracion = /* lua */ ''
      require("dashboard").setup(require("mestizo256.integraciones_especiales.dashboard").obtener({
         config = {
          center = {
            { desc = "[ Anfigeno] [ anfigenos] [ Anfigeno]" },
          },
        },
      }))
    '';
    lazy.eventos = [ "VimEnter" ];
  };
}
