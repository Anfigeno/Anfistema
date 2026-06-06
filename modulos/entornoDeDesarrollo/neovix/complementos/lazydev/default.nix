{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Lazydev" = {
    paquete = pkgs.vimPlugins.lazydev-nvim;
    configuracion = /* lua */ ''
      require("lazydev").setup({})
    '';
    lazy.tiposDeArchivo = [ "lua" ];
  };
}
