{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Hlchunk" = {
    paquete = pkgs.vimPlugins.hlchunk-nvim;
    configuracion = /* lua */ ''
      require("hlchunk").setup(require("mestizo256.integraciones_especiales.hlchunk").obtener())
    '';
    lazy.eventos = [
      "BufReadPre"
      "BufNewFile"
    ];
  };
}
