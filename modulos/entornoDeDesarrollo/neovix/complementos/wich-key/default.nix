{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Which Key" = {
    paquete = pkgs.vimPlugins.which-key-nvim;
    dependencias = with pkgs.vimPlugins; [ mini-icons ];
    configuracion = /* lua */ ''
      require("which-key").setup({})
    '';
    lazy = {
      eventos = [ "VeryLazy" ];
      teclas."<leader>?" = {
        accion = /* lua */ ''require("which-key").show({ global = false })'';
        descripcion = "Mostrar atajaos de teclado locales";
      };
    };
  };
}
