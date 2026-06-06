{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Stay Centered" = {
    paquete = pkgs.vimPlugins.stay-centered-nvim;
    configuracion = /* lua */ ''
      require("stay-centered").setup({
        skip_filetypes = { "dashboard" },
      })
    '';
    lazy.eventos = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
