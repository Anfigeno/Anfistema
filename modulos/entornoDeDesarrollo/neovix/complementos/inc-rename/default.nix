{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."IncRename" = {
    paquete = pkgs.vimPlugins.inc-rename-nvim;
    configuracion = /* lua */ ''
      require("inc_rename").setup({})
    '';
    lazy = {
      comandos = [ "IncRename" ];
      teclas."grn" = {
        comando = ":IncRename ";
        descripcion = "LSP: Renombrar";
      };
    };
  };
}
