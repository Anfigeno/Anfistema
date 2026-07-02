{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Gitsigns" = {
    paquete = pkgs.vimPlugins.gitsigns-nvim;
    configuracion = /* lua */ ''
      require("gitsigns").setup({ current_line_blame = true })
    '';
    lazy.eventos = [
      "BufReadPre"
      "BufNewFile"
    ];
  };
}
