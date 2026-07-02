{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Fidget" = {
    paquete = pkgs.vimPlugins.fidget-nvim;
    configuracion = /* lua */ ''
      require("fidget").setup({})
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
