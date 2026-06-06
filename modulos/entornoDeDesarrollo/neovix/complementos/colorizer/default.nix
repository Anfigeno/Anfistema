{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Colorizer" = {
    paquete = pkgs.vimPlugins.nvim-colorizer-lua;
    configuracion = /* lua */ ''
      require("colorizer").setup({})
    '';
    lazy.eventos = [ "BufReadPre" ];
  };
}
