{ util, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Mestizo 256" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "1947566ba39757344e06b28462fbd9a6291bec8b";
      ref = "main";
      repo = "TemaMestizo/Mestizo256.nvim";
    };
    configuracion = /* lua */ ''vim.cmd("colorscheme mestizo256")'';
    lazy.activar = false;
  };
}
