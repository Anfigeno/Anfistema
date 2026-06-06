{ util, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Keep Split Ratio" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "906aa5196e194dca12c7729069760d42e77ddcff";
      ref = "main";
      repo = "adlrwbr/keep-split-ratio.nvim";
    };
    configuracion = /* lua */ ''require("keep-split-ratio").setup({})'';
    lazy.eventos = [ "BufEnter" ];
  };
}
