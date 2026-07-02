{ pkgs, ... }:
/* lua */ ''
  vim.opt.termguicolors = true
  vim.opt.number = true
  vim.opt.autoindent = true
  vim.opt.expandtab = true
  vim.opt.showcmd = true
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
  vim.opt.clipboard = "unnamedplus"
  vim.opt.relativenumber = true
  vim.opt.shell = "${pkgs.fish}/bin/fish"
  vim.o.laststatus = 3
  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"

  vim.api.nvim_create_user_command("Pistas", function()
  	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, {})

  vim.keymap.set("n", "<c-s>", "<cmd>w<cr>")

  vim.o.winborder = "rounded"
''

+ (
  [
    "Error"
    "Info"
    "Hint"
    "Warn"
  ]
  |> map (clave: /* lua */ ''vim.fn.sign_define("DiagnosticSign${clave}",{ text = "󰊠 " }) '')
  |> builtins.concatStringsSep "\n"
)
