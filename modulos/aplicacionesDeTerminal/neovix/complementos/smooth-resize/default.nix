{ util, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Smooth Resize" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "5218aedc1dedb9c0c0f105b73f46e601f712a786";
      ref = "main";
      repo = "aronjohanns/smooth-resize.nvim";
    };
    configuracion = /* lua */ ''
      require("smooth-resize").setup({
        disabled_fts = { "fyler" }
      })
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
