extension AppString on String {
  String get baseUrlNews => "newsapi.org";
  String get baseUrl => "/v2/$this";
  String get baseUrlWithEveryThing => "everything".baseUrl;
  String get baseUrlWithTopHeadlines => "top-headlines".baseUrl;
  String get getApiKey => "e968be63e4f24814940b8feaaffc952d";
}
