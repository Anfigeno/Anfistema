{
  name = "Google";
  urls = [
    {
      template = "https://www.google.com/search";
      params = [
        {
          name = "q";
          value = "{searchTerms}";
        }
      ];
    }
  ];

  iconMapObj."16" = "https://www.google.com/favicon.ico";
}
