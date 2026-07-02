{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."No Neck Pain" = {
    paquete = pkgs.vimPlugins.no-neck-pain-nvim;
    lazy.teclas."<leader>nn" = {
      accion = /* lua */ ''require("no-neck-pain").toggle()'';
      descripcion = "No Neck Pain: Alternar centrar ventana";
    };
  };
}
