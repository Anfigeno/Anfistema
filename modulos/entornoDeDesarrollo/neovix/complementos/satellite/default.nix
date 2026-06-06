{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Satellite" = {
    paquete = pkgs.vimPlugins.satellite-nvim;
    configuracion = /* lua */ ''
      require("satellite").setup({
        excluded_filetypes = {
          "fyler",
          "Telescope",
          "Outline",
          "neo-tree",
          "toggleterm",
          "dashboard",
        },
      })
    '';
    lazy.eventos = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
