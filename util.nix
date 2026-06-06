{ pkgs, lib }:
{
  vim.obtenerComplementoDeGithub =
    {
      rev,
      ref,
      repo,
      dependencies ? [ ],
      nvimSkipModules ? [ ],
    }:
    pkgs.vimUtils.buildVimPlugin {
      name = "${lib.strings.sanitizeDerivationName repo}";
      src = fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
        rev = rev;
      };
      inherit dependencies nvimSkipModules;
    };
}
