{
  pkgs,
  util,
  usuario,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Tiny Code Action" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "897de9af9e3aa6e59bcb9fec760a7eb02d00e264";
      ref = "main";
      repo = "rachartier/tiny-code-action.nvim";
      nvimSkipModules = [
        "tiny-code-action.backend.difftastic"
        "tiny-code-action.backend.diffsofancy"
        "tiny-code-action.backend.delta"
        "tiny-code-action.previewers.snacks"
      ];
    };
    dependencias = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim
    ];
    dependenciasDeSistema = [ pkgs.delta ];
    configuracion = /* lua */ ''
      require("tiny-code-action").setup({
        backend = "delta"
      })
    '';
    lazy = {
      eventos = [ "LspAttach" ];
      teclas."gra" = {
        accion = /* lua */ ''require("tiny-code-action").code_action()'';
        descripcion = "LSP: Acción de código";
      };
    };
  };
}
