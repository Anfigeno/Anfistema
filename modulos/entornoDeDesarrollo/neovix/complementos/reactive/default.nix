{ util, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Reactive" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "0588b5c2b0cf49bd2232fe4366b3516c32edee44";
      ref = "main";
      repo = "rasulomaroff/reactive.nvim";
    };
    configuracion = /* lua */ ''
      require("reactive").setup({
        load = "mestizo256"
      })
    '';
    lazy.activar = false;
  };
}
