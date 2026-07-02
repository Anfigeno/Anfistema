{
  pkgs,
  usuario,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.anfistema.aplicacionesDeTerminal.neovix.activar {
    home-manager.users.${usuario}.programs.neovix.lspconfig = {
      configuraciones = {
        "lua_ls".paquete = pkgs.lua-language-server;
        "jsonls".paquete = pkgs.vscode-json-languageserver;
        "nixd".paquete = pkgs.nixd;
        "nil_ls".paquete = pkgs.nil;
        "biome".paquete = pkgs.biome;
        "basedpyright".paquete = pkgs.basedpyright;

        "ts_ls" = {
          paquete = pkgs.typescript-language-server;
          configuracion.settings = {
            javascript.inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
            };
            typescript.inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
            };
          };
        };
      };
    };
  };
}
