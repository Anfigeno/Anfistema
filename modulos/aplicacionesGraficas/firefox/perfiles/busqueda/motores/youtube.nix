{
  name = "Youtube";
  urls = [
    {
      template = "https://www.youtube.com/results";
      params = [
        {
          name = "search_query";
          value = "{searchTerms}";
        }
      ];
    }
  ];

  iconMapObj."16" = "https://www.youtube.com/favicon.ico";
}
