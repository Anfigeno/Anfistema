{
  name = "Home Manager Search";
  urls = [
    {
      template = "https://home-manager-options.extranix.com";
      params = [
        {
          name = "release";
          value = "master";
        }
        {
          name = "query";
          value = "{searchTerms}";
        }
      ];
    }
  ];

  iconMapObj."16" = "https://nixos.org/favicon.ico";
}
