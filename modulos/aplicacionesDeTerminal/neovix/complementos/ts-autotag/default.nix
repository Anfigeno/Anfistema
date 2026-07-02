{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."TS Autotag" = {
    paquete = pkgs.vimPlugins.ts-autotag-nvim;
    configuracion = /* lua */ ''
      require("ts-autotag").setup({
        auto_rename = { enable = true }
      })
    '';
    lazy.activar = false;
  };
}
