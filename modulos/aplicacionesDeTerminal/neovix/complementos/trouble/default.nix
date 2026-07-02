{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Trouble" = {
    paquete = pkgs.vimPlugins.trouble-nvim;
    configuracion = /* lua */ ''
      require("trouble").setup({
        auto_preview = false
      })
    '';
    lazy = {
      comandos = [ "Trouble" ];
      teclas = {
        "<space>td" = {
          accion = /* lua */ ''require("trouble").toggle({keys = "diagnostics"})'';
          descripcion = "Lsp: Diagnosticos globales";
        };
        "<space>tD" = {
          accion = /* lua */ ''require("trouble").toggle({keys = "diagnostics", filter = "buf=0"})'';
          descripcion = "Lsp: Diagnosticos locales";
        };
      };
    };
  };
}
