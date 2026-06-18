{
  pkgs,
  usuario,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.anfistema.entornoDeDesarrollo.neovix.activar {
    home-manager.users.${usuario}.programs.neovix.lenguajes = {
      "lua" = {
        gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
          lua
          luadoc
          luau
        ];
        formateadores = [ "stylua" ];
        lsps = [ "lua_ls" ];
      };
      "http".gramaticas = [ pkgs.vimPlugins.nvim-treesitter-parsers.http ];
      "json" = {
        gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
          json
          json5
        ];
        formateadores = [ "biome" ];
        lsps = [ "jsonls" ];
      };
      "python" = {
        gramaticas = [ pkgs.vimPlugins.nvim-treesitter-parsers.python ];
        formateadores = [ "black" ];
        lsps = [ "basedpyright" ];
        entornoDeEjecucion = "python";
      };
      "git".gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        gitattributes
        git_rebase
        git_config
        gitignore
        gitcommit
      ];
      "typescript" = {
        gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
          typescript
          tsx
        ];
        formateadores = [ "biome" ];
        lsps = [
          "ts_ls"
          "biome"
        ];
        entornoDeEjecucion = "bun";
      };
      "javascript" = {
        gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
          javascript
          jsdoc
        ];
        formateadores = [ "biome" ];
        lsps = [
          "ts_ls"
          "biome"
        ];
      };
      "nix" = {
        gramaticas = [ pkgs.vimPlugins.nvim-treesitter-parsers.nix ];
        formateadores = [ "nixfmt" ];
        lsps = [
          "nixd"
          "nil_ls"
        ];
      };
    };
  };
}
