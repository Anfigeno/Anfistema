{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Tabout" = {
    paquete = pkgs.vimPlugins.tabout-nvim;
    configuracion = /* lua */ ''
      require("tabout").setup({
        tabkey = "<Tab>",
        backwards_tabkey = "<s-Tab>",
      })
    '';
    lazy.eventos = [ "InsertEnter" ];
  };
}
